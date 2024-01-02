# SponUs-iOS

<aside>
💡 개발 시작 전 잘 숙지해 주세요!!

</aside>

# 이슈

1. 이슈를 등록할 때는 맨 앞에 이슈 종류 쓰기 (예: `[feat] 로그인 구현`)
1. 하나의 이슈가 크면 내부에 `task list` 만들어서 세분화하기
1. 이슈에 맞는 `label` 달기
1. 이슈를 등록하면 번호가 할당됨

# 브랜치

1. 브랜치명 = 이슈 번호 (예: `feat/#23`)
1. `하나의 브랜치`에서는 `하나의 이슈`만 작업함
1. 이슈가 커서 task list로 세분화했으면 그 브랜치를 task 브랜치로 나눈 후 작업하기
(예: `task/#23-1`, `task/#23-2`)
1. `task 브랜치`에는 `1개의 커밋`만 하는 게 최종 목표

# 커밋

1. 커밋 메시지 앞에 `[#이슈번호]` 넣기
1. task 브랜치인 경우 `[#이슈번호-task숫자]` 이런 식으로 커밋 메시지 앞에 추가
예) `[#23-1]`, `[#17-3]`
1. 이렇게 하면 그 커밋에 관련된 이슈를 확인할 수 있음

# PR

1. `PR(Pull Request)` 올리기
1. 이슈가 커서 `task 브랜치`로 쪼개서 작업을 한 경우에는 `기존 이슈 브랜치 방향`으로 PR 올리기
1. task 브랜치가 기존 이슈 브랜치로 모두 다 머지 되면 기존 이슈 브랜치는 develop 브랜치 방향으로 PR 올리기
1. Draft PR 올려야 된다면 PR명 앞에 `[Draft PR-#브랜치번호]` 붙여서 올리기
1. 코드 리뷰를 받고 피드백을 토대로 코드를 수정한 후 확인받기

# 그 외 중요 사항

1. (머지 방식) 머지는 무조건 `rebase`!!
1. `(진짜 중요)` 장기간 동안 나의 작업이 늦어지면 주기적으로 현재 작업 중인 브랜치에 remote/develop을 rebase 하면서 작업 진행하기
1. 자신의 브랜치를 체크아웃한 상태에서 develop 브랜치 우클릭한 후 rebase
내 브랜치가 develop 브랜치의 시점으로 올라간다고 생각하면 됨
`rebase (자신의 브랜치) onto (develop)`
