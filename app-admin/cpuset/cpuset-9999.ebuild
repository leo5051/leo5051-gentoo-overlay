# Copyleft 2019 Leonid V. Burinov
# All rights are left

EAPI=6

PYTHON_COMPAT=( python2_7 )
EGIT_REPO_URI="https://github.com/lpechacek/cpuset.git"

inherit distutils-r1 git-r3

DESCRIPTION="wrapper to make using the cpusets facilities easier"

HOMEPAGE="https://github.com/lpechacek/cpuset"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/configparser[${PYTHON_USEDEP}]
"

src_prepare() {
	distutils-r1_src_prepare
}

python_test() {
	esetup.py test
}
