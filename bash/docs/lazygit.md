# LAZYGIT

### 1. Configuration
```
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
gui:
  nerdFontsVersion: '3'
  showFileIcons: true
  showBranchCommitHash: true
customCommands:
  - key: "<c-c>"
    context: "files"
    description: 'commit files with format'
    prompts:
      - type: "menu"
        title: "What kind of commit type is it?"
        key: "Type"
        options:
          - name: "fix"
            description: "バグや不具合の修正"
            value: "fix"
      - type: "input"
        title: "(Optional) Enter the scope"
        key: "Scope"
        initialValue: ""
      - type: "input"
        title: "Enter the Message"
        key: "Message"
        initialValue: ""
      - type: "menu"
        title: "Choise the emoji"
        key: "Emoji"
        options:
          - name: '(empty)'
            description: ''
            value: ''
          - name: ':bug:'
            description: '(fix)🐛バグ修正'
            value: ':bug:'
          - name: ':tada'
            description: '(feat)🎉大きな機能追加'
            value: ':tada:'
          - name: ':sparkles:'
            description: '(feat)✨部分的な機能追加'
            value: ':sparkles:'
      - type: "confirm"
        title: "Commit"
        body: "Commit with the message '{{.Form.Type}}{{.Form.Scope}}: {{.Form.Message}}{{.Form.Emoji}}'. Is this okay?"
    command: "bash -c 'type=\"{{.Form.Type}}\"; scope=\"{{.Form.Scope}}\"; message=\"{{.Form.Message}}\"; emoji=\"{{.Form.Emoji}}\"; commit_message=\"$type${scope:+($scope)}: $message $emoji\"; git commit -m \"$commit_message\"'"
    loadingText: "Commiting..."
```
