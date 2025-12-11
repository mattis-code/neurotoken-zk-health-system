import { NeuroTokenClient } from "../../src/sdk/js/client.js"
const client = new NeuroTokenClient({ endpoint: "http://localhost" })
console.log(client.submitProgress({ score: 10 }))
