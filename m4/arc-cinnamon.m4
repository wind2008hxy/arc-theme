# ARC_CINNAMON()
# ---------------
AC_DEFUN([ARC_CINNAMON], [
    CINNAMON_DIR="$srcdir/common/cinnamon"
    AC_ARG_WITH(
        [cinnamon],
        [AS_HELP_STRING(
            [--with-cinnamon],
            [cinnamon minor version]
        )],
        [CINNAMON_VERSION="$withval"],
        [AC_CHECK_PROG(
            [CINNAMON_FOUND],
            [cinnamon],
            [yes],
            [no]
        )
        AS_IF(
            [test "x$CINNAMON_FOUND" = xyes],
            [CINNAMON_VERSION=`cinnamon --version | cut -d' ' -f2`]
            AC_MSG_RESULT([Detected cinnamon $CINNAMON_VERSION]),
            [AC_MSG_ERROR([Could not find cinnamon from \$PATH.])]
        )
        AS_IF(
            [test -z "$CINNAMON_VERSION"],
            [AC_MSG_ERROR([Could not determine cinnamon version.])]
        )]
    )

    # Trim version extras
    CINNAMON_VERSION=`echo $CINNAMON_VERSION | cut -d. -f-2`

    # Extra major and minor version components
    CINNAMON_VERSMJR=`echo $CINNAMON_VERSION | cut -d. -f1`
    CINNAMON_VERSMNR=`echo $CINNAMON_VERSION | cut -d. -f2`

    # Evenize the minor version for stable versions
    AS_IF(
        [test "0$CINNAMON_VERSMJR" -eq 3 -a "0$CINNAMON_VERSMNR" -ge 5], [CINNAMON_VERSION=3.6],
        [test "0$CINNAMON_VERSMJR" -ge 4], [CINNAMON_VERSION=3.6],
        [test `expr $CINNAMON_VERSMNR % 2` != "0"],
        [CINNAMON_VERSION="$CINNAMON_VERSMJR.`expr $CINNAMON_VERSMNR + 1`"]
    )
    AS_IF(
        [! test -e "$CINNAMON_DIR/$CINNAMON_VERSION"],
        [AC_MSG_ERROR([Invalid cinnamon version: $CINNAMON_VERSION])]
    )
    AC_SUBST([CINNAMON_VERSION])
    AC_MSG_RESULT([Building cinnamon theme $CINNAMON_VERSION])
])
