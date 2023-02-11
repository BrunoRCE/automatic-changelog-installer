#!/bin/bash
echo "
=============================================
-- Welcome to automatic changelog installer --
=============================================
"
echo "Enter the repository path: " 
read repository 
echo "\n---- Init node ----\n" 
npm init -y
echo "\n---- Download dependencies ----\n" 
npm i -g husky standard-version npm-add-script commitizen cz-conventional-changelog @commitlint/{config-conventional,cli} 
npx husky install
npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"
npx npmAddScript -k postinstall -v "husky install"
npx npmAddScript -k release -v "standard-version"
npx npmAddScript -k release:minor -v "standard-version --release-as minor"
npx npmAddScript -k release:patch -v "standard-version --release-as patch"
npx npmAddScript -k release:major -v "standard-version --release-as major"
echo '{ "path": "cz-conventional-changelog" }'>> .czrc
echo "{
  "\"extends"\": ["\"@commitlint/config-conventional"\"]
}">> .commitlintrc.json
echo "{
  "\"header"\": "\"Changelog"\",
  "\"types"\": [
    {"\"type"\": "\"feat"\", "\"section"\": "\"✨ Features"\"},
    {"\"type"\": "\"fix"\", "\"section"\": "\"🐛 Bug Fixes"\"},
    {"\"type"\": "\"chore"\", "\"section"\": "\"🚚 Chores"\","\"hidden"\": false},
    {"\"type"\": "\"docs"\", "\"section"\": "\"📝 Documentation"\","\"hidden"\": false},
    {"\"type"\": "\"style"\", "\"section"\": "\"💄 Styling"\","\"hidden"\": false},
    {"\"type"\": "\"refactor"\", "\"section"\": "\"♻️ Code Refactoring"\","\"hidden"\": false},
    {"\"type"\": "\"perf"\", "\"section"\": "\"⚡️ Performance Improvements"\","\"hidden"\": false},
    {"\"type"\": "\"test"\", "\"section"\": "\"✅ Testing"\","\"hidden"\": false}
  ],
  "\"commitUrlFormat"\": "\"$repository/commit/{{hash}}"\",
  "\"compareUrlFormat"\": "\"$repository/compare/{{previousTag}}...{{currentTag}}"\",
  "\"issuePrefixes"\": ["\"#"\"],
  "\"issueUrlFormat"\": "\"$repository/issues/{{id}}"\"
}">> .versionrc.json
