# Link Zotero `return → welfare` to `draft/literature/paper`

Keep paper **metadata** in the Zotero collection **`return → welfare`**. Keep those **PDFs** as linked attachments in:

`C:\Users\birdy\Desktop\return\draft\literature\paper`

Other collections are left alone: use ZotMoov in **manual** mode and run it only on selected items inside `return → welfare`.

## Paths

| Role | Path |
|------|------|
| PDF folder | `C:\Users\birdy\Desktop\return\draft\literature\paper` |
| Linked Attachment Base Directory | `C:\Users\birdy\Desktop\return\draft\literature` |
| Zotero collection | `return → welfare` |

## One-time setup

### 1. Install ZotMoov (Zotero 7)

1. Download the latest `.xpi` from [ZotMoov releases](https://github.com/wileyyugioh/zotmoov/releases).
2. In Zotero: **Tools → Plugins**.
3. Install the `.xpi` (gear / Install Add-on From File).
4. Restart Zotero.

### 2. Linked Attachment Base Directory

1. **Edit → Settings → Advanced → Files and Folders**.
2. Under **Linked Attachment Base Directory**, click **Choose...**.
3. Select: `C:\Users\birdy\Desktop\return\draft\literature`.

This only helps Zotero resolve linked paths. It does not move files by itself and is not collection-specific.

### 3. ZotMoov settings (manual only)

1. Open ZotMoov settings in Zotero.
2. Set **Directory to Move Files To** to:  
   `C:\Users\birdy\Desktop\return\draft\literature\paper`
3. Turn **off** automatic move/copy when files are added.  
   Manual-only prevents other collections from being rewritten when you add PDFs elsewhere.

## Move existing `welfare` attachments

1. Open collection **`return → welfare`** only (do not select the whole library).
2. Select the items or PDF attachments in that collection.
3. Right-click → **ZotMoov: Move Selected to Directory**.
4. Verify: right-click one attachment → **Show File**.  
   It must open under `draft\literature\paper`, not `Zotero\storage`.

## Day-to-day

1. Add or find the item in **`return → welfare`**.
2. Attach the PDF in Zotero as usual (stored file is fine at first).
3. Select **only that item/attachment**.
4. Right-click → **ZotMoov: Move Selected to Directory**.
5. Confirm with **Show File**.

Do **not** select all of My Library and run ZotMoov. That would move attachments from other collections into the same folder.

## Without ZotMoov (single file)

1. Put the PDF in `draft\literature\paper`.
2. Right-click the Zotero item → **Add Attachment → Attach Link to File...**.
3. Choose the PDF in `draft\literature\paper`.
4. Optionally delete the old stored attachment after **Show File** confirms the linked path.

## What this does not do

- Zotero cannot bind a collection to a Windows folder as a true two-way sync.
- The Linked Attachment Base Directory setting is global; safety for other collections comes from **never running ZotMoov outside `return → welfare`**.
