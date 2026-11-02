#!/bin/sh
set -eu
unset GIT_AUTHOR_DATE GIT_COMMITTER_DATE

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf '%s\n' "Ошибка: каталог не является Git-репозиторием." >&2
    exit 1
fi

if [ "$(git branch --show-current)" != "main" ]; then
    printf '%s\n' "Ошибка: переключитесь на ветку main перед запуском сценария." >&2
    exit 1
fi

if git rev-parse --verify HEAD >/dev/null 2>&1; then
    printf '%s\n' "Ошибка: в репозитории уже есть коммиты; сценарий рассчитан на новый репозиторий." >&2
    exit 1
fi

if ! git diff --cached --quiet; then
    printf '%s\n' "Ошибка: индекс Git уже содержит подготовленные изменения." >&2
    exit 1
fi

git add .gitignore README.md assets/README.md docs/COURSE.md docs/START.md lecture/README.md materials/README.md
git commit -m "Добавить структуру и план курса"

git add homeworks/README.md homeworks/01-virtual-machine/README.md homeworks/02-operating-systems/README.md
git commit -m "Подготовить задания по среде и истории ОС"

git add homeworks/03-filesystem-fhs/README.md homeworks/04-files-and-search/README.md
git commit -m "Подготовить задания по файловой системе и поиску"

git add homeworks/05-users-and-groups/README.md homeworks/06-permissions/README.md
git commit -m "Подготовить задания по пользователям и правам"

git add homeworks/07-processes/README.md homeworks/08-diagnostics/README.md
git commit -m "Подготовить задания по процессам и диагностике"

git add labs/README.md labs/lab01/README.md
git commit -m "Описать лабораторное исследование системы"

git add reports/README.md reports/system-passport-template.md reports/investigation-template.md reports/reproducibility-template.md docs/SUBMIT.md scripts/README.md
git commit -m "Добавить шаблоны отчётов и правила сдачи"

git add scripts/commit-course.sh
git commit -m "Добавить сценарий последовательных коммитов"
#!/bin/sh
set -eu
unset GIT_AUTHOR_DATE GIT_COMMITTER_DATE

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf '%s\n' "Ошибка: каталог не является Git-репозиторием." >&2
    exit 1
fi

if [ "$(git branch --show-current)" != "main" ]; then
    printf '%s\n' "Ошибка: переключитесь на ветку main перед запуском сценария." >&2
    exit 1
fi

if git rev-parse --verify HEAD >/dev/null 2>&1; then
    printf '%s\n' "Ошибка: в репозитории уже есть коммиты; сценарий рассчитан на новый репозиторий." >&2
    exit 1
fi

if ! git diff --cached --quiet; then
    printf '%s\n' "Ошибка: индекс Git уже содержит подготовленные изменения." >&2
    exit 1
fi

git add .gitignore README.md assets/README.md docs/COURSE.md docs/START.md lecture/README.md materials/README.md
git commit -m "Добавить структуру и план курса"

git add homeworks/README.md homeworks/01-virtual-machine/README.md homeworks/02-operating-systems/README.md
git commit -m "Подготовить задания по среде и истории ОС"

git add homeworks/03-filesystem-fhs/README.md homeworks/04-files-and-search/README.md
git commit -m "Подготовить задания по файловой системе и поиску"

git add homeworks/05-users-and-groups/README.md homeworks/06-permissions/README.md
git commit -m "Подготовить задания по пользователям и правам"

git add homeworks/07-processes/README.md homeworks/08-diagnostics/README.md
git commit -m "Подготовить задания по процессам и диагностике"

git add labs/README.md labs/lab01/README.md
git commit -m "Описать лабораторное исследование системы"

git add reports/README.md reports/system-passport-template.md reports/investigation-template.md reports/reproducibility-template.md docs/SUBMIT.md scripts/README.md
git commit -m "Добавить шаблоны отчётов и правила сдачи"

git add scripts/commit-course.sh
git commit -m "Добавить сценарий последовательных коммитов"
