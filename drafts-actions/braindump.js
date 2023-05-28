let notion = Notion.create()
const databaseId = "5d22ddaad8c74012a8eec5b1af8bd04b"
/* you can get databaseName by querying
let databases = notion.request({
  url: `https://api.notion.com/v1/databases/${databaseId}`,
  method: "GET",
})
alert(`Databases: ${JSON.stringify(databases)}`)
 */
const databaseName = "Name"
const lines = draft.content
  .replace(/$\s*\n+/gm, "\n")
  .trim()
  .split("\n")
const title = lines.shift().replace(/^# /, "")
let url = ""
const children = []
function addBlock(line) {
  const urlRegex =
    /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$/
  // Validate URL
  if (urlRegex.test(line)) {
    url = line
    return
  }
  const block = { object: "block", type: "paragraph" }
  const anyPref = /^(\s*([-*+]|#+)\s+)/

  // map prefix to block type
  const types = new Map([
    ["to_do", /^(\s*[-*+]\s\[\s]\s+)/],
    ["bulleted_list_item", /^(\s*[-*+]\s+)/],
    ["heading_3", /^(\s*###\s+)/],
    ["heading_2", /^(\s*##\s+)/],
    ["heading_1", /^(\s*#\s+)/],
  ])

  // if any prefix
  if (anyPref.test(line)) {
    // get type
    types.forEach((reg, name) => {
      if (reg.test(line)) {
        block.type = name
        line = line.replace(reg, "")
      }
    })
  }
  // complete block
  block[block.type] = { rich_text: [{ type: "text", text: { content: line } }] }

  children.push(block)
}

// ---------------------

//if lines, add child blocks
if (lines) {
  lines.forEach(addBlock)
}

const data = {
  parent: { database_id: databaseId },
  icon: {
    emoji: "📥",
  },
  children,
  properties: {
    [databaseName]: {
      title: [
        {
          text: {
            content: title,
          },
        },
      ],
    },
    ...(url.length && { URL: { url } }),
  },
}

let response = notion.request({
  url: "https://api.notion.com/v1/pages",
  method: "POST",
  data,
})
// let response = notion.request({
//   url: `https://api.notion.com/v1/databases/61b0772ff380439199f81fd0a6ee81d0`,
//   method: 'GET',
// })
// result has JSON payload
// with page properties
if (response.statusCode == 200) {
  console.log(`Notion Pages Loaded: ${response.responseText}`)
} else {
  alert(`Notion Error: ${response.statusCode}

${notion.lastError}`)
  context.fail()
}
