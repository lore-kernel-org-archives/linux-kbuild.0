Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:55286 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753160AbeADUQw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jan 2018 15:16:52 -0500
Message-ID: <1515096931.31439.647.camel@oracle.com>
Subject: Re: [PATCH v3 1/1] runchecks: Generalize make C={1,2} to support
 multiple checkers
From: Knut Omang <knut.omang@oracle.com>
Date: Thu, 04 Jan 2018 21:15:31 +0100
In-Reply-To: <874lo1aait.fsf@intel.com>
References: <cover.5b56d020b8e826a7da33b1823c059acd0c123f8b.1515072782.git-series.knut.omang@oracle.com>
         <5f292b7effba0efcf4855bff83b7b9313ac45895.1515072782.git-series.knut.omang@oracle.com>
         <874lo1aait.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, John Haxby <john.haxby@oracle.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Julia Lawall <Julia.Lawall@lip6.fr>, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, Matthew Wilcox <willy@infradead.org>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org

On Thu, 2018-01-04 at 17:50 +0200, Jani Nikula wrote:
> On Thu, 04 Jan 2018, Knut Omang <knut.omang@oracle.com> wrote:
> > Add scripts/runchecks which has generic support for running
> > checker tools in a convenient and user friendly way that
> > the author hopes can contribute to rein in issues detected
> > by these tools in a manageable and convenient way.
> >
> > scripts/runchecks provides the following basic functionality:
> >
> > * Makes it possible to selectively suppress output from individual
> >   checks on a per file or per subsystem basis.
> > * Unifies output and suppression input from different tools
> >   by providing a single unified syntax and presentation for the
> >   underlying tools in the style of "scripts/checkpatch.pl --show-types"=
.
> > * Allows selective run of one, or more (or all) configured tools
> >   for each file.
> >
> > In the Makefile system, the sparse specific setup has been replaced
> > by setup for runchecks.
> >
> > This version of runchecks together with a "global" configuration
> > file in "scripts/runchecks.cfg" supports sparse, checkpatch, and checkd=
oc,
> > a trivial abstraction above a call to 'kernel-doc -none'.
> > It also supports forwarding calls to coccicheck for coccinelle support
> > but this is not quite as worked through as the three other checkers,
> > mainly because of lack of error data as all checks pass by default
> > right now.
> >
> > The code is designed to be easily extensible to support more checkers
> > as they emerge, and some generic checker support is even available
> > just via simple additions to "scripts/runchecks.cfg".
> >
> > The runchecks program unifies configuration, processing
> > and output for multiple checker tools to make them
> > all run as part of the C=3D1 or C=3D2 option to make.
> >
> > Currently with full support and unified behaviour for
> > sparse:     sparse
> > checkpatch: scripts/checkpatch.pl
> > checkdoc:   kernel-doc -none
> >
> > In principle supported but not unified in output(yet):
> > coccinelle: scripts/coccicheck
> >
> > Introduces a new documentation section titled
> > "Makefile support for running checkers"
> >
> > Also updates documentation for the make C=3D option
> > in some other doc files, as the behaviour has
> > been changed to be less sparse specific and more
> > generic. The coccinelle documentation also had the
> > behaviour of C=3D1 and C=3D2 swapped.
>=20
> I'm surprised the commit message and the provided documentation say
> nothing about using CHECK=3Dfoo on the command line. That already support=
s
> arbitrary checkers.=20

The problem, highlighted by Jim Davis in

https://lkml.org/lkml/2017/11/20/638

is that the current solution isn't flexible enough - that discussion=20
is what lead me to this reimplementation of what I originally intended=20
to be a checkpatch only solution.

> How does this relate to that? Is this supposed to be
> a complete replacement? Or what?

It has evolved into a complete replacement of the intention of CHECK.

> 'make help' also references $CHECK, and this patch doesn't update the
> help text.

I realize now that this needs to be handled in some way due to the way I sp=
lit the=20
arguments with '--' - the intention was to keep it for bw compatibility.

It would be good to know if people rely on using CHECK with C=3D{1,2} for=
=20
anything beside the checkers supported by runchecks today, if not,=20
it could either be removed or simply replace by an expansion into a '--run:=
$CHECK'
argument to runchecks=20

Then runchecks' implicit method of declaring=20

    checker <checkername> <full-path-to-checker>

in scripts/runchecks.cfg could be used for people with checkers that
need no further input/output adaptation.

Further suggestions appreciated on this matter.

> > Signed-off-by: Knut Omang <knut.omang@oracle.com>
> > Reviewed-by: H=C3=A5kon Bugge <haakon.bugge@oracle.com>
> > Reviewed-by: =C3=85smund =C3=98stvold <asmund.ostvold@oracle.com>
> > Reviewed-by: John Haxby <john.haxby@oracle.com>
> > ---
> >  Documentation/dev-tools/coccinelle.rst |  12 +-
> >  Documentation/dev-tools/index.rst      |   1 +-
> >  Documentation/dev-tools/runchecks.rst  | 215 ++++++++-
> >  Documentation/dev-tools/sparse.rst     |  30 +-
> >  Documentation/kbuild/kbuild.txt        |   9 +-
> >  Makefile                               |  23 +-
> >  scripts/Makefile.build                 |   4 +-
> >  scripts/runchecks                      | 734 +++++++++++++++++++++++++=
+-
> >  scripts/runchecks.cfg                  |  63 ++-
> >  scripts/runchecks_help.txt             |  43 ++-
>=20
> Please get rid of runchecks_help.txt and use the usual python mechanisms
> to specify and parse command line options, with their help texts,
> including automated --help output. This keeps the implementation and the
> help together, with hopes they'll actually stay in sync. Please don't
> hand roll argument parsers in python.

Hmm - I have been burnt by the use of unstable interfaces in Python before,
when I needed it to work on a (Linux) system with Python v.2.6.x only
- argparse was introduced in v.2.7. and alternative choices are not=20
at all clear to me, see for instance:

   https://dmerej.info/blog/post/docopt-v-argparse/

If this program was part of a "standalone" python project with a well defin=
ed python
environment, I would probably have used argparse, which I have used in othe=
r projects.

In fact I hesitated even to use python for this, because of fear of version=
ing issues..
When I was tempted anyway, and after looking at the existing examples in sc=
ripts/=20
ruling out python v.3.x, it felt safer to stay with the bare minimum of mod=
ule=20
features for this simple logic.

I do feel confident that the benefits of python for this outweighs the draw=
backs
compared to my initial shell script implementation, or using perl or even C=
.

Further advice on this appreciated,

Thanks,
Knut

>=20
> BR,
> Jani.
>=20
> >  10 files changed, 1114 insertions(+), 20 deletions(-)
> >  create mode 100644 Documentation/dev-tools/runchecks.rst
> >  create mode 100755 scripts/runchecks
> >  create mode 100644 scripts/runchecks.cfg
> >  create mode 100644 scripts/runchecks_help.txt
> >
> > diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev=
-
> tools/coccinelle.rst
> > index 94f41c2..c98cc44 100644
> > --- a/Documentation/dev-tools/coccinelle.rst
> > +++ b/Documentation/dev-tools/coccinelle.rst
> > @@ -157,17 +157,19 @@ For example, to check drivers/net/wireless/ one m=
ay write::
> > =20
> >      make coccicheck M=3Ddrivers/net/wireless/
> > =20
> > -To apply Coccinelle on a file basis, instead of a directory basis, the
> > -following command may be used::
> > +To apply Coccinelle as the only checker on a file basis,
> > +instead of a directory basis, the following command may be used::
> > =20
> > -    make C=3D1 CHECK=3D"scripts/coccicheck"
> > +    make C=3D2 CF=3D"--run:coccicheck"
> > =20
> > -To check only newly edited code, use the value 2 for the C flag, i.e.:=
:
> > +To check only newly edited code, use the value 1 for the C flag, i.e.:=
:
> > =20
> > -    make C=3D2 CHECK=3D"scripts/coccicheck"
> > +    make C=3D1 CF=3D"--run:coccicheck"
> > =20
> >  In these modes, which works on a file basis, there is no information
> >  about semantic patches displayed, and no commit message proposed.
> > +For more information about options in this calling mode, see
> > +Documentation/dev-tools/runchecks.rst .
> > =20
> >  This runs every semantic patch in scripts/coccinelle by default. The
> >  COCCI variable may additionally be used to only apply a single
> > diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tool=
s/index.rst
> > index e313925..cb4506d 100644
> > --- a/Documentation/dev-tools/index.rst
> > +++ b/Documentation/dev-tools/index.rst
> > @@ -16,6 +16,7 @@ whole; patches welcome!
> > =20
> >     coccinelle
> >     sparse
> > +   runchecks
> >     kcov
> >     gcov
> >     kasan
> > diff --git a/Documentation/dev-tools/runchecks.rst b/Documentation/dev-
> tools/runchecks.rst
> > new file mode 100644
> > index 0000000..1a43c05
> > --- /dev/null
> > +++ b/Documentation/dev-tools/runchecks.rst
> > @@ -0,0 +1,215 @@
> > +.. Copyright 2017 Knut Omang <knut.omang@oracle.com>
> > +
> > +Makefile support for running checkers
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Tools like sparse, coccinelle, and scripts/checkpatch.pl are able to d=
etect a
> > +lot of syntactic and semantic issues with the code, and are also const=
antly
> > +evolving and detecting more. In an ideal world, all source files shoul=
d
> > +adhere to whatever rules imposed by checkpatch.pl and sparse etc. with=
 all
> > +bells and whistles enabled, in a way that these checkers can be run as=
 a reflex
> > +by developers (and by bots) from the top level Makefile for every chan=
ging
> > +source file. In the real world however there's a number of challenges:
> > +
> > +* Sometimes there are valid reasons for accepting violations of a chec=
ker
> > +  rule, even if that rule is a sensible one in the general case.
> > +* Some subsystems have different restrictions and requirements.
> > +  (Ideally, the number of subsystems with differing restrictions and
> > +  requirements will diminish over time.)
> > +* Similarly, the kernel contains a lot of code that predates the tools=
, or at
> > +  least some of the newer rules, and we would like these tools to evol=
ve without
> > +  requiring the need to fix all issues detected with it in the same co=
mmit.
> > +  We also want to accommodate new tools, so that each new tool does no=
t
> > +  have to reinvent its own mechanism for running checks.
> > +* On the other hand, we want to make sure that files that are clean
> > +  (to some well defined extent, such as passing checkpatch or sparse
> > +  with checks only for certain important types of issues) keep being s=
o.
> > +
> > +This is the purpose of ``scripts/runchecks``.
> > +
> > +The ``runchecks`` program looks for files named ``runchecks.cfg`` in t=
he
> > +``scripts`` directory, then in the directory hierarchy of the source f=
ile,
> > +starting from where the source file is located, searching upwards. If =
at least
> > +one such file exists in the source tree, ``runchecks`` parses a set of
> > +rules from it, and uses them to determine how to invoke a set of indiv=
idual
> > +checker tools for a particular file. The kernel Makefile system suppor=
ts
> > +this feature as an integrated part of compiling the code, using the
> > +``C=3D{1,2}`` option. With::
> > +
> > +	make C=3D1
> > +
> > +runchecks will be invoked if the file needs to be recompiled. With ::
> > +
> > +	make C=3D2
> > +
> > +runchecks will be invoked for all source files, even if they do not ne=
ed
> > +recompiling. Based on the configuration, ``runchecks`` will invoke one=
 or
> > +more checkers. The number and types of checkers to run are configurabl=
e and
> > +can also be selected on the command line::
> > +
> > +	make C=3D2 CF=3D"--run:sparse,checkpatch"
> > +
> > +If only one checker is run, any parameter that is not recognized by
> > +``runchecks`` itself will be forwarded to the checker. If more than on=
e checker
> > +is enabled, parameters can be forwarded to a specific checker by means=
 of
> > +this syntax::
> > +
> > +	make C=3D2 CF=3D"--to-checkpatch:--terse"
> > +
> > +A comma separated list of parameters can be supplied if necessary.
> > +
> > +Supported syntax of the runchecks.cfg configuration file
> > +--------------------------------------------------------
> > +
> > +The ``runchecks`` configuration file chain can be used to set policies=
 and "rein in"
> > +checker errors piece by piece for a particular subsystem or driver. It=
 can
> > +also be used to mitigate and extend checkers that do not support
> > +selective suppression of all it's checks.
> > +
> > +Two classes of configuration are available. The first class is configu=
ration
> > +that defines what checkers are enabled, and some logic to allow better
> > +suppression or a more unified output of warning messages.
> > +This type of configuration should go into the first accessed
> > +configuration file, and has been preconfigured for the currently suppo=
rted
> > +checkers in ``scripts/runchecks.cfg``. The second class is the feature=
s for
> > +configuring the output of the checkers by selectively suppressing chec=
ks on
> > +a per file or per check basis. These typically go in the source tree i=
n
> > +the directory of the source file or above. Some of the syntax is gener=
ic
> > +and some is only supported by some checkers.
> > +
> > +For the first class of configuration the following syntax is supported=
::
> > +
> > +	# comments
> > +	checker checkpatch [command]
> > +	addflags <list of extra flags and parameters>
> > +	cflags
> > +	typedef NAME <regular expression>
> > +	run [checker list|all]
> > +
> > +The ``checker`` command switches ``runchecks``'s attention to a partic=
ular
> > +checker. The following commands until the next ``checker`` statement
> > +apply to that particular checker. The first occurrence of ``checker``
> > +also serves as a potentially defining operation, if the checker name
> > +has not been preconfigured. In that case, a second parameter can be us=
ed
> > +to provide the name of the command used to run the checker.
> > +A full checker integration into runchecks will typically require some
> > +additions to runchecks, and will then have been preconfigured,
> > +but simple checkers might just be configured on the fly.
> > +
> > +The ``addflags`` command incrementally adds more flags and parameters =
to
> > +the command line used to invoke the checker. This applies to all
> > +invocations of the checker from runchecks.
> > +
> > +The ``cflags`` command forwards all the flags and options passed to
> > +the compiler invocation to the checker. The default is to suppress the=
se
> > +parameters when invoking the checker.
> > +
> > +The ``typedef`` command adds ``NAME`` and associates it with the given=
 regular
> > +expression. This expression is used to match against standard error ou=
tput from
> > +the checker. In the kernel tree, ``NAME`` can then be used in local
> > +``runcheck.cfg`` files as a new named check that runchecks understands=
 and that
> > +can be used with checker supported names below to selectively suppress=
 that
> > +particular set of warning or error messages. This is useful to handle =
output
> > +checks for which the underlying checker does not provide any suppressi=
on.  Check
> > +type namespaces are separate for the individual checkers. You can list=
 the state
> > +of the built in and configured checker and check types with::
> > +
> > +	scripts/runchecks --list
> > +
> > +The checker implementations of the ``typedef`` command also allow runc=
hecks to
> > +perform some unification of output by rewriting the output lines, and =
use of the
> > +new type names in the error output, to ease the process of updating th=
e
> > +runchecks.cfg files.  It also adds some limited optional color support=
.  Having
> > +a unified representation of the error output also makes it much easier=
 to do
> > +statistics or other operations on top of an aggregated output from sev=
eral
> > +checkers.
> > +
> > +For the second class of configuration the following syntax is supporte=
d::
> > +
> > +	# comments
> > +	checker checker_name
> > +	except check_type [files ...]
> > +	pervasive check_type1 [check_type2 ...]
> > +	line_len <n>
> > +
> > +The ``except`` directive takes a check type such as for example
> > +``MACRO_ARG_REUSE``, and a set of files that should not be subject to =
this
> > +particular check type. The ``pervasive`` command disables the listed t=
ypes
> > +of checks for all the files in the subtree.  The ``except`` and
> > +``pervasive`` directives can be used cumulatively to add more exceptio=
ns.
> > +The ``line_len`` directive defines the upper bound of characters per l=
ine
> > +tolerated in this directory. Currently only ``checkpatch`` supports th=
is
> > +command.
> > +
> > +Options when running checker programs from make
> > +-----------------------------------------------
> > +
> > +A make variable ``CF`` allows passing additional parameters to
> > +``runchecks``. You can for instance use::
> > +
> > +	make C=3D2 CF=3D"--run:checkpatch --fix-inplace"
> > +
> > +to run only the ``checkpatch`` checker, and to have checkpatch try to =
fix
> > +issues it finds - *make sure you have a clean git tree and carefully r=
eview
> > +the output afterwards!* Combine this with selectively enabling of type=
s of
> > +errors via changes under ``checker checkpatch`` to the local
> > +``runchecks.cfg``, and you can focus on fixing up errors subsystem or
> > +driver by driver on a type by type basis.
> > +
> > +By default runchecks will skip all files if a ``runchecks.cfg`` file c=
annot
> > +be found in the directory of the file or in the tree above.  This is t=
o
> > +allow builds with ``C=3D2`` to pass even for subsystems that have not =
yet done
> > +anything to rein in checker errors. At some point when all subsystems =
and
> > +drivers either have fixed all checker errors or added proper
> > +``runchecks.cfg`` files, this can be changed.
> > +Note that the runchecks.cfg file in the scripts/ directory is special,=
 in that
> > +it can be present without triggering checker runs in the main kernel t=
ree.
> > +
> > +To force runchecks to run a full run in directories/trees where runche=
cks
> > +does not find  a ``runchecks.cfg`` file as well, use::
> > +
> > +	make C=3D2 CF=3D"-f"
> > +
> > +If you like to see all the warnings and errors produced by the checker=
s, ignoring
> > +any runchecks.cfg files except the one under ``scripts``, you can use:=
:
> > +
> > +	make C=3D2 CF=3D"-n"
> > +
> > +or for a specific module directory::
> > +
> > +	make C=3D2 M=3Ddrivers/infiniband/core CF=3D"--color -n -w"
> > +
> > +with the -w option to ``runchecks`` to suppress errors from any of the
> > +checkers and just continue on, and the ``--color`` option to present e=
rrors
> > +with colors where supported.
> > +
> > +Ever tightening checker rules
> > +-----------------------------
> > +
> > +Commit the changes to the relevant ``runchecks.cfg`` together with the=
 code
> > +changes that fixes a particular type of issue, this will allow automat=
ic
> > +checker running by default. This way we can ensure that new errors of =
that
> > +particular type do not inadvertently sneak in again! This can be done =
at
> > +any subsystem or module maintainer's discretion and at the right time
> > +without having to do it all at the same time.
> > +
> > +Before submitting your changes, verify that a full "make C=3D2" passes
> > +with no errors.
> > +
> > +Extending and improving checker support in ``runchecks``
> > +--------------------------------------------------------
> > +
> > +The runchecks program has been written with extensibility in mind.
> > +If the checker starts its reporting lines with filename:lineno, there'=
s a
> > +good chance that a new checker can simply be added by adding::
> > +
> > +	checker mychecker path_to_mychecker
> > +
> > +to ``scripts/runchecks.cfg`` and suitable ``typedef`` expressions to p=
rovide
> > +selective suppressions of output, however it is likely that some quirk=
s are
> > +needed to make the new checker behave similarly to the others, and to =
support
> > +the full set of features, such as the ``--list`` option. This is done =
by
> > +implementing a new subclass of the Checker class in ``runchecks``. Thi=
s is the
> > +way all the available default supported checkers are implemented, and =
those
> > +relatively lean implementations could serve as examples for support fo=
r future
> > +checkers.
> > diff --git a/Documentation/dev-tools/sparse.rst b/Documentation/dev-too=
ls/sparse.rst
> > index 78aa00a..e3e8b27 100644
> > --- a/Documentation/dev-tools/sparse.rst
> > +++ b/Documentation/dev-tools/sparse.rst
> > @@ -101,5 +101,31 @@ recompiled, or use "make C=3D2" to run sparse on t=
he files whether
> they need to
> >  be recompiled or not.  The latter is a fast way to check the whole tre=
e if you
> >  have already built it.
> > =20
> > -The optional make variable CF can be used to pass arguments to sparse.=
  The
> > -build system passes -Wbitwise to sparse automatically.
> > +The "make C=3D{1,2}" form of kernel make indirectly calls sparse via "=
runchecks",
> > +which dependent on configuration and command line options may dispatch=
 calls to
> > +other checkers in addition to sparse. Details on how this works is cov=
ered
> > +in Documentation/dev-tools/runchecks.rst .
> > +
> > +The optional make variable CF can be used to pass arguments to runchec=
ks for dispatch
> > +to sparse. If sparse is the only tool enabled, any option not recogniz=
ed by
> > +runchecks will be forwarded to sparse. If more than one tool is active=
, you must
> > +add the parameters you want sparse to get as a comma separated list pr=
efixed by
> > +``--to-sparse:``. If you want sparse to be the only checker run, and y=
ou want
> > +some nice colored output, you can specify this as::
> > +
> > +	make C=3D2 CF=3D"--run:sparse --color"
> > +
> > +This will cause sparse to be called for all files which are supported =
by a valid
> > +runchecks configuration (again see Documentation/dev-tools/runchecks.r=
st for
> > +details). If you want to run sparse on all files and ignore any missin=
g
> > +configuration files(s), just add ``-n`` to the list of options passed =
to
> > +runchecks. This will cause runchecks to call sparse with all errors en=
abled for
> > +all files even if no valid configuration is found in the tree for the =
source files.
> > +
> > +By default "runchecks" is set to enable all sparse errors, but you can
> > +configure what checks to be applied by sparse on a per file or per sub=
system
> > +basis. With the above invocation, make will fail and stop on the first=
 file
> > +encountered with sparse errors or warnings in it. If you want to conti=
nue
> > +anyway, you can use::
> > +
> > +	make C=3D2 CF=3D"--run:sparse --color -w"
> > diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbu=
ild.txt
> > index ac2363e..260e688 100644
> > --- a/Documentation/kbuild/kbuild.txt
> > +++ b/Documentation/kbuild/kbuild.txt
> > @@ -103,10 +103,13 @@ CROSS_COMPILE is also used for ccache in some set=
ups.
> > =20
> >  CF
> >  --------------------------------------------------
> > -Additional options for sparse.
> > -CF is often used on the command-line like this:
> > +Additional options for runchecks, the generic checker runner.
> > +CF is often used on the command-line for instance like this:
> > =20
> > -    make CF=3D-Wbitwise C=3D2
> > +    make C=3D2 CF=3D"--run:sparse --color -w"
> > +
> > +to run the sparse tool only, and to use colored output and continue on=
 warnings
> > +or errors.
> > =20
> >  INSTALL_PATH
> >  --------------------------------------------------
> > diff --git a/Makefile b/Makefile
> > index eb1f597..bba07b9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -159,14 +159,22 @@ ifeq ($(skip-makefile),)
> >  # so that IDEs/editors are able to understand relative filenames.
> >  MAKEFLAGS +=3D --no-print-directory
> > =20
> > -# Call a source code checker (by default, "sparse") as part of the
> > -# C compilation.
> > +# Do source code checking as part of the C compilation.
> > +#
> >  #
> >  # Use 'make C=3D1' to enable checking of only re-compiled files.
> >  # Use 'make C=3D2' to enable checking of *all* source files, regardles=
s
> >  # of whether they are re-compiled or not.
> >  #
> > -# See the file "Documentation/dev-tools/sparse.rst" for more details,
> > +# Source code checking is done via the runchecks script, which
> > +# has knowledge of each individual cheker and how it wants to be calle=
d,
> > +# as well as options for rules as to which checks that are applicable
> > +# to different parts of the kernel, at source file granularity.
> > +#
> > +# Several types of checking is available, and custom checkers can also
> > +# be added.
> > +#
> > +# See the file "Documentation/dev-tools/runchecks.rst" for more detail=
s,
> >  # including where to get the "sparse" utility.
> > =20
> >  ifeq ("$(origin C)", "command line")
> > @@ -383,10 +391,9 @@ INSTALLKERNEL  :=3D installkernel
> >  DEPMOD		=3D /sbin/depmod
> >  PERL		=3D perl
> >  PYTHON		=3D python
> > -CHECK		=3D sparse
> > =20
> > -CHECKFLAGS     :=3D -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
> > -		  -Wbitwise -Wno-return-void $(CF)
> > +CHECK		=3D $(srctree)/scripts/runchecks
> > +CHECKFLAGS      =3D
> >  NOSTDINC_FLAGS  =3D
> >  CFLAGS_MODULE   =3D
> >  AFLAGS_MODULE   =3D
> > @@ -429,7 +436,7 @@ GCC_PLUGINS_CFLAGS :=3D
> >  export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD=
 CC
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
> >  export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
> > -export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> > +export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECK_CFLAGS CHECKFLA=
GS
> > =20
> >  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAG=
S
> >  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE CFLAGS_KASAN CFLAGS_U=
BSAN
> > @@ -778,7 +785,7 @@ endif
> > =20
> >  # arch Makefile may override CC so keep this after arch Makefile is in=
cluded
> >  NOSTDINC_FLAGS +=3D -nostdinc -isystem $(call shell-cached,$(CC) -prin=
t-file-
> name=3Dinclude)
> > -CHECKFLAGS     +=3D $(NOSTDINC_FLAGS)
> > +CHECK_CFLAGS     +=3D $(NOSTDINC_FLAGS)
> > =20
> >  # warn about C99 declaration after statement
> >  KBUILD_CFLAGS +=3D $(call cc-option,-Wdeclaration-after-statement,)
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index cb8997e..13325b3 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -93,10 +93,10 @@ __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $=
(lib-target)
> $(extra-y)) \
> >  ifneq ($(KBUILD_CHECKSRC),0)
> >    ifeq ($(KBUILD_CHECKSRC),2)
> >      quiet_cmd_force_checksrc =3D CHECK   $<
> > -          cmd_force_checksrc =3D $(CHECK) $(CHECKFLAGS) $(c_flags) $< =
;
> > +          cmd_force_checksrc =3D $(CHECK) $(CF) $< -- $(CHECKFLAGS) $(=
c_flags);
> >    else
> >        quiet_cmd_checksrc     =3D CHECK   $<
> > -            cmd_checksrc     =3D $(CHECK) $(CHECKFLAGS) $(c_flags) $< =
;
> > +            cmd_checksrc     =3D $(CHECK) $(CF) $< -- $(CHECKFLAGS) $(=
c_flags);
> >    endif
> >  endif
> > =20
> > diff --git a/scripts/runchecks b/scripts/runchecks
> > new file mode 100755
> > index 0000000..4dd2969
> > --- /dev/null
> > +++ b/scripts/runchecks
> > @@ -0,0 +1,734 @@
> > +#!/usr/bin/python
> > +
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserve=
d.
> > +#    Author: Knut Omang <knut.omang@oracle.com>
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2
> > +# as published by the Free Software Foundation.
> > +
> > +# The program implements a generic and extensible code checker runner
> > +# that supports running various checker tools from the kernel Makefile
> > +# or standalone, with options for selectively suppressing individual
> > +# checks on a per file or per check basis.
> > +#
> > +# The program has some generic support for checkers, but to implement
> > +# support for a new checker to the full extent, it might be necessary =
to
> > +#   1) subclass the Checker class in this file with checker specific p=
rocessing.
> > +#   2) add typedef definitions in runchecks.cfg in this directory
> > +#
> > +# This version of runchecks has full support for the following tools:
> > +#   sparse:      installed separately
> > +#   checkpatch:  checkpatch.pl
> > +#   checkdoc:    kernel-doc -none
> > +#
> > +# See file "Documentation/dev-tools/runchecks.rst" for more details
> > +#
> > +
> > +import sys, os, subprocess, fcntl, select, re
> > +from os.path import dirname, basename
> > +
> > +class CheckError(Exception):
> > +    def __init__(self, value):
> > +        self.value =3D value
> > +    def __str__(self):
> > +        return self.value
> > +
> > +def usage():
> > +    manual =3D os.path.join(srctree, "scripts/runchecks_help.txt")
> > +    f =3D open(manual, "r")
> > +    for line in f:
> > +        sys.stdout.write(line)
> > +    f.close()
> > +    print ""
> > +    print "Configured checkers:"
> > +    for (c, v) in checker_types.iteritems():
> > +        enabled =3D "[default disabled]"
> > +        for c_en in config.checkers:
> > +            if c_en.name =3D=3D c:
> > +                enabled =3D ""
> > +                break
> > +        print "  %-20s %s" % (c, enabled)
> > +    exit(1)
> > +
> > +
> > +# A small configuration file parser:
> > +#
> > +class Config:
> > +    def __init__(self, srctree, workdir, filename):
> > +        self.path =3D []
> > +        self.relpath =3D {}
> > +        relpath =3D ""
> > +
> > +        # Look for a global config file in the scripts directory:
> > +        file =3D os.path.join(srctree, "scripts/%s" % filename)
> > +        if os.path.exists(file):
> > +            self.path.append(file)
> > +            self.relpath[file] =3D relpath
> > +
> > +        while not ignore_config:
> > +            self.file =3D os.path.join(workdir,filename)
> > +            if os.path.exists(self.file):
> > +                self.path.append(self.file)
> > +                self.relpath[self.file] =3D relpath
> > +            if len(workdir) <=3D len(srctree):
> > +                break
> > +            relpath =3D "%s/%s" % (basename(workdir), relpath)
> > +            workdir =3D dirname(workdir)
> > +
> > +        self.checkers =3D []
> > +        self.cur_chk =3D None
> > +        self.color =3D False
> > +        self.list_only =3D False
> > +
> > +        self.command =3D {
> > +            "checker"	: self.checker,
> > +            "addflags"	: self.addflags,
> > +            "run"	: self.runlist,
> > +            "except"	: self.exception,
> > +            "pervasive" : self.pervasive,
> > +            "cflags"	: self.cflags,
> > +            "typedef"	: self.typedef
> > +        }
> > +
> > +        if verbose:
> > +            print "  ** runchecks: config path: %s" % self.path
> > +        for f in self.path:
> > +            self.ParseConfig(f)
> > +
> > +    def checker(self, argv):
> > +        try:
> > +            self.cur_chk =3D checker_types[argv[0]]
> > +        except KeyError:
> > +            if len(argv) < 2:
> > +                d1 =3D "generic checker configurations!"
> > +                raise CheckError("%s:%d: use 'checker %s command' for =
%s" % \
> > +                                 (self.file, self.lineno, argv[0], d1)=
)
> > +
> > +            AddChecker(Checker(argv[0], argv[1], srctree, workdir))
> > +            self.cur_chk =3D checker_types[argv[0]]
> > +
> > +    def addflags(self, argv):
> > +        self.cur_chk.addflags(argv)
> > +
> > +    def exception(self, argv):
> > +        type =3D argv[0]
> > +        if self.cur_chk:
> > +            relpath =3D self.relpath[self.file]
> > +            self.cur_chk.exception(type, relpath, argv[1:])
> > +        else:
> > +            raise CheckError("%s:%d: checker has not been set" % (self=
.file,
> self.lineno))
> > +
> > +    def pervasive(self, argv):
> > +        self.cur_chk.pervasive(argv)
> > +
> > +    def runlist(self, argv):
> > +        try:
> > +            for c in argv:
> > +                self.checkers.append(checker_types[c])
> > +        except KeyError, k:
> > +            if str(k) =3D=3D "'all'":
> > +                self.checkers =3D checker_types.values()
> > +            else:
> > +                available =3D "\n  -- avaliable checkers are: %s" %
> ",".join(checker_types.keys())
> > +                raise CheckError("Checker %s not found - not configure=
d?%s" %
> (str(k), available))
> > +
> > +    def cflags(self, argv):
> > +        self.cur_chk.cflags =3D True
> > +
> > +    def typedef(self, argv):
> > +        self.cur_chk.typedef(argv)
> > +
> > +    # Parse one configuration file in the configuration file list:
> > +    #
> > +    def ParseConfig(self, file):
> > +        f =3D open(file, 'r')
> > +        self.file =3D file
> > +        self.lineno =3D 0
> > +        for line in f:
> > +            self.lineno =3D self.lineno + 1
> > +            token =3D line.split()
> > +            if len(token) < 1:
> > +                continue
> > +            if token[0][0] =3D=3D '#':
> > +                continue
> > +            try:
> > +                self.command[token[0]](token[1:])
> > +            except KeyError:
> > +                if not self.cur_chk:
> > +                    raise CheckError("%s:%s: checker has not been set"=
 % (self.file,
> self.lineno))
> > +                self.cur_chk.ParseOptional(token[0], token[1:])
> > +            except AttributeError:
> > +                if not self.cur_chk:
> > +                    raise CheckError("%s:%s: checker has not been set"=
 % (self.file,
> self.lineno))
> > +
> > +        f.close()
> > +        self.cur_chk =3D None
> > +
> > +    # Option forwarding to checkers
> > +    # and optional selection of which checkers to run:
> > +    def ProcessOpts(self, opts):
> > +        for opt in opts:
> > +            if opt =3D=3D "--color":
> > +                self.color =3D True
> > +                continue
> > +            elif opt =3D=3D "--list":
> > +                self.list_only =3D True
> > +                continue
> > +            elif opt =3D=3D "--help":
> > +                usage_only =3D True
> > +
> > +            fw =3D re.match("^--to-(\w+):(.*)$", opt)
> > +            if fw:
> > +                try:
> > +                    cname =3D fw.group(1)
> > +                    checker =3D checker_types[cname]
> > +                except:
> > +                    raise CheckError("Unknown checker '%s' specified i=
n option '%s'"
> % (cname, opt))
> > +                newargs =3D fw.group(2).split(',')
> > +                checker.cmdvec +=3D newargs
> > +                if verbose:
> > +                    print "Added extra args for %s: %s" % (cname, newa=
rgs)
> > +                continue
> > +
> > +            runopt =3D re.match("^--run:(.*)$", opt)
> > +            if runopt:
> > +                clist =3D runopt.group(1).split(",")
> > +                # Command line override: reset list of checkers
> > +                self.checkers =3D []
> > +                self.runlist(clist)
> > +                continue
> > +
> > +            if len(self.checkers) =3D=3D 1:
> > +                # If only one checker enabled, just pass everything we=
 don't know
> about through:
> > +                self.checkers[0].cmdvec.append(opt)
> > +            else:
> > +                raise CheckError("Unknown option '%s'" % opt)
> > +
> > +    # We always expect at least one config file that sets up the activ=
e checkers:
> > +    #
> > +    def HasPathConfig(self):
> > +        return len(self.path) > 1
> > +
> > +
> > +# The base class for checkers:
> > +# For specific support a particular checker, implement a subclass of t=
his:
> > +#
> > +class Checker:
> > +    def __init__(self, name, cmd, srctree, workdir, ofilter =3D None, =
efilter =3D None):
> > +        self.name =3D name
> > +        self.srctree =3D srctree
> > +	self.workdir =3D workdir
> > +	self.efilter =3D efilter
> > +        if ofilter:
> > +            self.ofilter =3D ofilter
> > +        else:
> > +            self.ofilter =3D self.suppress
> > +        self.strout =3D ""
> > +        self.strerr =3D ""
> > +        self.cflags =3D False
> > +        if cmd[0:7] =3D=3D "scripts":
> > +            cmd =3D os.path.join(self.srctree, cmd)
> > +        self.cmd =3D cmd
> > +        self.cmdvec =3D cmd.split()
> > +        self.pervasive_opts =3D [] # "global" ignore list
> > +        self.exceptions =3D []     # exception list for this file
> > +        self.file_except =3D []    # Aggregated list of check types to=
 ignore for this
> file
> > +        self.re_except_def =3D {}  # check_type -> <regex to match it =
in stderr>
> > +        self.doc =3D {}		 # Used when parsing documentation: check typ=
e
> -> doc string
> > +        self.cont =3D []
> > +        self.last_ignore =3D False
> > +        self.unclassified =3D 0	 # With RegexFilter: Number of "red" l=
ines not
> classified
> > +
> > +    def filter_env(self, dict):
> > +        return dict
> > +
> > +    def readline(self, is_stdout, fd):
> > +        tmp_str =3D ""
> > +        try:
> > +            s =3D os.read(fd, 1000)
> > +            while s !=3D '':
> > +                tmp_str +=3D s
> > +                s =3D os.read(fd, 1)
> > +        except OSError:
> > +            None
> > +
> > +        if is_stdout:
> > +            self.strout +=3D tmp_str
> > +            tmp_str =3D self.strout
> > +        else:
> > +            self.strerr +=3D tmp_str
> > +            tmp_str =3D self.strerr
> > +
> > +        inx =3D tmp_str.find('\n') + 1
> > +        if inx !=3D 0:
> > +            t =3D tmp_str[:inx]
> > +            if is_stdout:
> > +                self.strout =3D tmp_str[inx:]
> > +            else:
> > +                self.strerr =3D tmp_str[inx:]
> > +        else:
> > +            return ''
> > +        return t
> > +
> > +    def SetNonblocking(self, fd):
> > +        fl =3D fcntl.fcntl(fd, fcntl.F_GETFL)
> > +        try:
> > +            fcntl.fcntl(fd, fcntl.F_SETFL, fl | os.O_NDELAY)
> > +        except AttributeError:
> > +            fcntl.fcntl(fd, fcntl.F_SETFL, fl | fcntl.FNDELAY)
> > +
> > +    def Run(self, file, verbose):
> > +        cmdvec =3D self.cmdvec
> > +        if self.cflags:
> > +            cmdvec +=3D c_argv
> > +        if not force:
> > +            self.file_except =3D set(self.exceptions + self.pervasive_=
opts)
> > +        self.Postprocess()
> > +        if not file:
> > +            raise CheckError("error: missing file parameter")
> > +        cmdvec.append(file)
> > +        if debug:
> > +            print "  ** running %s: %s" % (self.name, " ".join(cmdvec)=
)
> > +        elif verbose:
> > +            print "  -- checker %s --" % self.name
> > +        try:
> > +            ret =3D self.RunCommand(cmdvec, self.ofilter, self.efilter=
)
> > +        except OSError, e:
> > +            if re.match(".*No such file or directory", str(e)):
> > +                if len(config.checkers) =3D=3D 1:
> > +                    raise CheckError("Failed to run checker %s: %s: %s=
" % (self.name,
> self.cmd, str(e)))
> > +                if verbose:
> > +                    print "  ** %s does not exist - ignoring %s **" % =
(self.name,
> self.cmd)
> > +                return 0
> > +        ret =3D self.PostRun(ret)
> > +        return ret
> > +
> > +    def RunCommand(self, cmdvec, ofilter, efilter):
> > +	my_env =3D self.filter_env(os.environ)
> > +        child =3D subprocess.Popen(cmdvec, shell =3D False, \
> > +                     stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIP=
E, cwd=3D".",
> env=3Dmy_env)
> > +        sout =3D child.stdout
> > +        serr =3D child.stderr
> > +        ofd =3D sout.fileno()
> > +        efd =3D serr.fileno()
> > +        oeof =3D False
> > +        eeof =3D False
> > +        check_errors =3D []
> > +        self.SetNonblocking(ofd)
> > +        self.SetNonblocking(efd)
> > +        while True:
> > +            ready =3D select.select([ofd,efd],[],[],0.1)
> > +            if ofd in ready[0]:
> > +                if child.poll() !=3D None:
> > +                    oeof =3D True
> > +                oline =3D self.readline(True, ofd)
> > +                while oline !=3D '':
> > +                    if ofilter:
> > +                        ofilter(oline, verbose)
> > +                    else:
> > +                        sys.stdout.write(oline)
> > +                    oline =3D self.readline(True, ofd)
> > +            if efd in ready[0]:
> > +                if child.poll() !=3D None:
> > +                    eeof =3D True
> > +                eline =3D self.readline(False, efd)
> > +                while eline !=3D '':
> > +                    if efilter:
> > +                        check_err =3D efilter(eline, verbose)
> > +                        if check_err !=3D None:
> > +                                check_errors.append(check_err)
> > +                    else:
> > +                        sys.stderr.write(eline)
> > +                    eline =3D self.readline(False, efd)
> > +            if oeof and eeof:
> > +                break
> > +        serr.close()
> > +        sout.close()
> > +        retcode =3D child.wait()
> > +        if check_errors !=3D []:
> > +            estr =3D "".join(check_errors)
> > +            if estr !=3D "":
> > +                sys.stderr.write(estr)
> > +                if not retcode:
> > +                    retcode =3D 131
> > +            else:
> > +                if verbose:
> > +                    print "%s  ** %d suppressed errors/warnings from %=
s%s" % (BLUE,
> len(check_errors), self.name, ENDCOLOR)
> > +                retcode =3D 0
> > +        return retcode
> > +
> > +    def ParseOptional(self, cmd, argv):
> > +        raise CheckError("Undefined command '%s' for checker '%s'" % (=
cmd,
> self.name))
> > +
> > +    # Called as final step before running the checker:
> > +    def Postprocess(self):
> > +        # Do nothing - just for redefinition in subclasses
> > +        return
> > +
> > +    # Called as a post processing step after running the checker:
> > +    # Input parameter is return value from Run()
> > +    def PostRun(self, retval):
> > +        # Do nothing - just for redefinition in subclasses
> > +        return retval
> > +
> > +    # Default standard output filter:
> > +    def suppress(self, line, verbose):
> > +        if verbose:
> > +            sys.stdout.write(line)
> > +
> > +    # A matching filter for stderr:
> > +    def RegexFilter(self, line, verbose):
> > +        if self.cont:
> > +            m =3D re.match(self.cont[0], line)
> > +            self.cont =3D self.cont[1:]
> > +            if m:
> > +                if self.last_ignore:
> > +                    return ""
> > +                else:
> > +                    return line
> > +
> > +        for t, regex in self.re_except_def.iteritems():
> > +            r =3D "^(.*:\d+:)\s(\w+:)\s(%s.*)$" % regex[0]
> > +            m =3D re.match(r, line)
> > +            if m:
> > +                if len(regex) > 1:
> > +                    self.cont =3D regex[1:]
> > +                if t in self.file_except:
> > +                    self.last_ignore =3D True
> > +                    return ""
> > +                else:
> > +                    self.last_ignore =3D False
> > +                    return "%s%s %s:%s%s%s: %s %s\n" % (BROWN, m.group=
(1),
> self.name.upper(), BLUE, t, ENDCOLOR, m.group(2), m.group(3))
> > +        self.unclassified =3D self.unclassified + 1
> > +        return RED + line + ENDCOLOR
> > +
> > +    def ListTypes(self):
> > +        if len(self.re_except_def) > 0:
> > +            print BLUE + BOLD + "  Check types declared for %s in runc=
hecks
> configuration%s" % (self.name, ENDCOLOR)
> > +        for t, regex in self.re_except_def.iteritems():
> > +            print "\t%-22s %s" % (t, "\\n".join(regex))
> > +        if len(self.re_except_def) > 0:
> > +            print ""
> > +        return 0
> > +
> > +    def addflags(self, argv):
> > +        self.cmdvec +=3D argv
> > +
> > +    def exception(self, type, relpath, argv):
> > +        for f in argv:
> > +            if f =3D=3D ("%s%s" % (relpath, bfile)):
> > +                self.exceptions.append(type)
> > +
> > +    def pervasive(self, argv):
> > +        self.pervasive_opts +=3D argv
> > +
> > +    def typedef(self, argv):
> > +        exp =3D " ".join(argv[1:])
> > +        elist =3D exp.split("\\n")
> > +        self.re_except_def[argv[0]] =3D elist
> > +
> > +
> > +# Individual checker implementations:
> > +#
> > +
> > +# checkpatch
> > +class CheckpatchRunner(Checker):
> > +    def __init__(self, srctree, workdir):
> > +        Checker.__init__(self, "checkpatch", "scripts/checkpatch.pl", =
srctree,
> workdir)
> > +        self.cmdvec.append("--file")
> > +        self.line_len =3D 0
> > +        # checkpatch sends all it's warning and error output to stdout=
,
> > +        # redirect and do limited filtering:
> > +        self.ofilter =3D self.out_filter
> > +
> > +    def ParseOptional(self, cmd, argv):
> > +        if cmd =3D=3D "line_len":
> > +            self.line_len =3D int(argv[0])
> > +        else:
> > +            Checker.ParseOptional(self, cmd, argv)
> > +
> > +    def Postprocess(self):
> > +        if config.color:
> > +            self.cmdvec.append("--color=3Dalways")
> > +        if self.line_len:
> > +            self.cmdvec.append("--max-line-length=3D%d" % self.line_le=
n)
> > +        if self.file_except:
> > +            self.cmdvec.append("--ignore=3D%s" % ",".join(self.file_ex=
cept))
> > +
> > +    # Extracting a condensed doc of types to filter on:
> > +    def man_filter(self, line, verbose):
> > +        t =3D line.split()
> > +        if len(t) > 1 and t[1] !=3D "Message":
> > +            sys.stdout.write("\t%s\n" % t[1])
> > +
> > +    def out_filter(self, line, verbose):
> > +        # --terse produces this message even with no errors,
> > +        #  suppress unless run with -v:
> > +        if not verbose and re.match("^total: 0 errors, 0 warnings, 0 c=
hecks,", line):
> > +            return
> > +        sys.write.stderr(line)
> > +
> > +    def ListTypes(self):
> > +        print BLUE + BOLD + "  Supported check types for checkpatch" +=
 ENDCOLOR
> > +        # Parse help output:
> > +        cmdvec =3D ["%s/scripts/checkpatch.pl" % self.srctree, "--list=
-types"]
> > +        self.RunCommand(cmdvec, self.man_filter, None)
> > +        print ""
> > +        return 0
> > +
> > +# sparse
> > +class SparseRunner(Checker):
> > +    def __init__(self, srctree, workdir):
> > +        Checker.__init__(self, "sparse", "sparse", srctree, workdir)
> > +        self.efilter =3D self.RegexFilter
> > +
> > +    def sparse_name(self, rs_type):
> > +        l_name =3D rs_type.lower()
> > +        s_name =3D ""
> > +        for c in l_name:
> > +            if c =3D=3D '_':
> > +                s_name +=3D '-'
> > +            else:
> > +                s_name +=3D c
> > +        return s_name
> > +
> > +    def runchecks_name(self, sparse_type):
> > +        u_name =3D sparse_type.upper()
> > +        rc_name =3D""
> > +        for c in u_name:
> > +            if c =3D=3D '-':
> > +                rc_name +=3D '_'
> > +            else:
> > +                rc_name +=3D c
> > +        return rc_name
> > +
> > +    def Postprocess(self):
> > +        if self.file_except:
> > +            for e in self.file_except:
> > +                self.cmdvec.append("-Wno-%s" % self.sparse_name(e))
> > +
> > +    # Extracting a condensed doc of types to filter on:
> > +    def man_filter(self, line, verbose):
> > +        if self.doc_next:
> > +            doc =3D line.strip()
> > +            self.doc[self.doc_next] =3D doc
> > +            self.doc_next =3D False
> > +            return
> > +        match =3D re.search("^\s+-W([\w-]+)\s*$", line)
> > +        if match:
> > +            name =3D match.group(1)
> > +            if re.match("sparse-", name):
> > +                return
> > +            rs_type =3D self.runchecks_name(name)
> > +            self.doc_next =3D rs_type
> > +
> > +    def ListTypes(self):
> > +        # Parse manual output:
> > +        cmdvec =3D ["man", "sparse"]
> > +        self.doc_next =3D False
> > +        ret =3D self.RunCommand(cmdvec, self.man_filter, None)
> > +        if ret:
> > +            return ret
> > +        print BLUE + BOLD + "\n  Types derived from sparse from docume=
ntation in
> manpage" + ENDCOLOR
> > +        for t, doc in self.doc.iteritems():
> > +            print "\t%-22s %s" % (t, doc)
> > +            try:
> > +                regex =3D self.re_except_def[t]
> > +                print "\t%-22s %s" % ("", GREEN + "\\n".join(regex) + =
ENDCOLOR)
> > +            except:
> > +                print "\t%-22s %s" % ("", RED + "(regex match (typedef=
) missing)" +
> ENDCOLOR)
> > +        print BLUE + BOLD + "\n  Types for sparse only declared for ru=
nchecks or not
> documented in manpage" + ENDCOLOR
> > +        for t, regex in self.re_except_def.iteritems():
> > +            try:
> > +                self.doc[t]
> > +            except:
> > +                print "\t%-22s %s" % (t, GREEN + "\\n".join(regex) + E=
NDCOLOR)
> > +        print ""
> > +        return 0
> > +
> > +# checkdoc
> > +class CheckdocRunner(Checker):
> > +    def __init__(self, srctree, workdir):
> > +        Checker.__init__(self, "checkdoc", "scripts/kernel-doc", srctr=
ee, workdir)
> > +        self.cmdvec.append("-none")
> > +        self.efilter =3D self.RegexFilter
> > +
> > +# coccicheck (coccinelle) (WIP)
> > +class CoccicheckRunner(Checker):
> > +    def __init__(self, srctree, workdir):
> > +        Checker.__init__(self, "coccicheck", "scripts/coccicheck", src=
tree, workdir)
> > +        self.debug_file =3D None
> > +        self.efilter =3D self.CoccicheckFilter
> > +
> > +    def filter_env(self, dict):
> > +        newdict =3D os.environ
> > +        # If debug file is not set by the user, override it and presen=
t the output on
> stderr:
> > +        try:
> > +            df =3D newdict["DEBUG_FILE"]
> > +        except:
> > +            print "*** debug_file!"
> > +            self.debug_file =3D '/tmp/cocci_%s.log' % os.getpid()
> > +            newdict["DEBUG_FILE"] =3D self.debug_file
> > +        return newdict
> > +
> > +    def CoccicheckFilter(self, line, verbose):
> > +        self.unclassified =3D self.unclassified + 1
> > +        if re.match(".*spatch -D report", line):
> > +            if verbose:
> > +                sys.stdout.write(line)
> > +        else:
> > +            return RED + line + ENDCOLOR
> > +
> > +    def PostRun(self, retval):
> > +        if not self.debug_file:
> > +            return retval
> > +        f =3D open(self.debug_file)
> > +        for line in f:
> > +            line =3D self.CoccicheckFilter(line, verbose)
> > +            if line:
> > +                sys.stderr.write(line)
> > +        f.close()
> > +        if self.debug_file:
> > +            os.remove(self.debug_file)
> > +        if retval =3D=3D 0:
> > +            reval =3D ret
> > +        return retval
> > +
> > +checker_types =3D {}
> > +
> > +def AddChecker(checker):
> > +    checker_types[checker.name] =3D checker
> > +
> > +#
> > +# Start main program:
> > +#
> > +program =3D os.path.realpath(sys.argv[0])
> > +progname =3D basename(program)
> > +scriptsdir =3D dirname(program)
> > +srctree =3D dirname(scriptsdir)
> > +force =3D False
> > +ignore_config =3D False
> > +verbose =3D False
> > +debug =3D False
> > +error =3D True
> > +error_on_red =3D False
> > +usage_only =3D False
> > +argv =3D []
> > +c_argv =3D []
> > +fw_opts =3D []
> > +workdir =3D os.getcwd()
> > +optarg =3D False
> > +argc =3D 0
> > +
> > +AddChecker(CheckpatchRunner(srctree, workdir))
> > +AddChecker(SparseRunner(srctree, workdir))
> > +AddChecker(CheckdocRunner(srctree, workdir))
> > +AddChecker(CoccicheckRunner(srctree, workdir))
> > +
> > +for arg in sys.argv[1:]:
> > +    argc =3D argc + 1
> > +
> > +    if arg =3D=3D "--":
> > +        argc =3D argc + 1
> > +        c_argv =3D sys.argv[argc:]
> > +        break;
> > +    elif arg =3D=3D "-f":
> > +        force =3D True
> > +    elif arg =3D=3D "-n":
> > +        ignore_config =3D True
> > +        force =3D True
> > +    elif arg =3D=3D "-w":
> > +        error =3D False
> > +    elif arg =3D=3D "-t":
> > +        error_on_red =3D True
> > +        error =3D False
> > +    elif arg =3D=3D "-d":
> > +        debug =3D True
> > +    elif arg =3D=3D "-v":
> > +        verbose =3D True
> > +    elif arg =3D=3D "-h":
> > +        usage_only =3D True
> > +    else:
> > +        opt =3D re.match("^-.*$", arg)
> > +        if opt:
> > +            # Delay processing of these until we know the configuratio=
n:
> > +            fw_opts.append(opt.group(0))
> > +        else:
> > +            argv.append(arg)
> > +
> > +if not verbose:
> > +    try:
> > +        verb =3D int(os.environ["V"])
> > +        if verb !=3D 0:
> > +            verbose =3D True
> > +    except KeyError:
> > +        verbose =3D False
> > +
> > +if not os.path.exists(os.path.join(srctree, "MAINTAINERS")):
> > +    srctree =3D None
> > +
> > +try:
> > +    file =3D argv[0]
> > +    bfile =3D basename(file)
> > +    workdir =3D dirname(file)
> > +except:
> > +    bfile =3D None
> > +    file =3D None
> > +
> > +unclassified =3D 0
> > +
> > +if debug:
> > +    print "Kernel root:\t%s\nFile:\t\t%s\nWorkdir:\t%s" % \
> > +        (srctree, bfile, workdir)
> > +    print "C args:\t\t%s\nargv:\t\t%s\n" % (" ".join(c_argv), " ".join=
(argv))
> > +
> > +try:
> > +    config =3D Config(srctree, workdir, "runchecks.cfg")
> > +    config.ProcessOpts(fw_opts)
> > +
> > +    if usage_only:
> > +        usage()
> > +    if not config.HasPathConfig() and not config.list_only and not for=
ce:
> > +        if verbose:
> > +            print "  ** %s: No configuration found - skip checks for %=
s" % (progname,
> file)
> > +        exit(0)
> > +
> > +    if config.color:
> > +        GREEN =3D '\033[32m'
> > +        RED =3D '\033[91m'
> > +        BROWN =3D '\033[33m'
> > +        BLUE =3D '\033[34m'
> > +        BOLD =3D '\033[1m'
> > +        ENDCOLOR =3D '\033[0m'
> > +    else:
> > +        BOLD =3D ''
> > +        GREEN =3D ''
> > +        RED =3D ''
> > +        BROWN =3D ''
> > +        BLUE =3D ''
> > +        ENDCOLOR =3D ''
> > +
> > +    ret =3D 0
> > +    for checker in config.checkers:
> > +        if config.list_only:
> > +            ret =3D checker.ListTypes()
> > +        else:
> > +            ret =3D checker.Run(file, verbose)
> > +            unclassified +=3D checker.unclassified
> > +        if ret and error:
> > +            break
> > +
> > +    if not error and not (error_on_red and unclassified > 0):
> > +        ret =3D 0
> > +except CheckError, e:
> > +    print "  ** %s: %s" % (progname, str(e))
> > +    ret =3D 22
> > +except KeyboardInterrupt:
> > +    if verbose:
> > +        print "  ** %s: Interrupted by user" % progname
> > +    ret =3D 4
> > +
> > +exit(ret)
> > diff --git a/scripts/runchecks.cfg b/scripts/runchecks.cfg
> > new file mode 100644
> > index 0000000..c0b12cf
> > --- /dev/null
> > +++ b/scripts/runchecks.cfg
> > @@ -0,0 +1,63 @@
> > +checker checkpatch
> > +addflags  --quiet --show-types --strict --emacs
> > +line_len 110
> > +
> > +checker sparse
> > +addflags -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wsparse-all
> > +cflags
> > +
> > +#	Name		Regular expression for matching in checker output
> > +typedef DECL		symbol '.*' was not declared. Should it be static\?
> > +typedef SHADOW		symbol '\w+' shadows an earlier one\n.*originally
> declared here
> > +typedef TYPESIGN	incorrect type in argument \d+ \(different
> signedness\)\n.*expected\n.*got
> > +typedef RETURN_VOID	returning void-valued expression
> > +typedef SIZEOF_BOOL	expression using sizeof bool
> > +typedef CONTEXT		context imbalance in '.*'
> > +typedef MEMCPY_MAX_COUNT \w+ with byte count of
> > +typedef CAST_TO_AS	cast adds address space to expression
> > +typedef ADDRESS_SPACE	incorrect type in .* \(different address
> spaces\)\n.*expected\n.*got
> > +typedef PTR_INHERIT	incorrect type in .* \(different base
> types\)\n.*expected\n.*got
> > +typedef PTR_SUBTRACTION_BLOWS potentially expensive pointer subtractio=
n
> > +typedef VLA		Variable length array is used
> > +typedef OVERFLOW	constant [x\dA-F]+ is so big it is \w+
> > +typedef TAUTOLOGICAL_COMPARE self-comparison always evaluates to (true=
|false)
> > +typedef NON_POINTER_NULL Using plain integer as NULL pointer
> > +typedef BOOL_CAST_RESTRICTED restricted \w+ degrades to integer
> > +typedef TYPESIGN	incorrect type in .* \(different
> signedness\)\n.*expected\n.*got
> > +typedef FUNCTION_REDECL symbol '.*' redeclared with different type \(o=
riginally
> declared at
> > +typedef COND_ADDRESS_ARRAY the address of an array will always evaluat=
e as true
> > +typedef BITWISE 	cast (to|from) restricted
> > +
> > +# Type names invented here - not maskable from sparse?
> > +typedef NO_DEREF	dereference of noderef expression
> > +typedef ARG_TYPE_MOD	incorrect type in .* \(different
> modifiers\)\n.*expected\n.*got
> > +typedef ARG_TYPE_COMP	incorrect type in .* \(incompatible
> .*\(.*\)\)\n.*expected\n.*got
> > +typedef ARG_AS_COMP	incompatible types in comparison expression \(diff=
erent
> address spaces\)
> > +typedef CMP_TYPE	incompatible types in comparison expression \(differe=
nt base
> types\)
> > +typedef SPARSE_OFF	"Sparse checking disabled for this file"
> > +typedef CAST_TRUNC	cast truncates bits from constant value
> > +typedef CAST_FROM_AS	cast removes address space of expression
> > +typedef EXT_LINK_DEF	function '\w+' with external linkage has definiti=
on
> > +typedef FUNC_ARITH	arithmetics on pointers to functions
> > +typedef CALL_NO_TYPE	call with no type!
> > +typedef FUNC_SUB	subtraction of functions\? Share your drugs
> > +typedef STRING_CONCAT	trying to concatenate \d+-character string \(\d+=
 bytes
> max\)
> > +typedef INARG_DIRECTIVE directive in argument list
> > +typedef NONSCALAR_CAST  cast (to|from) non-scalar
> > +
> > +checker checkdoc
> > +typedef PARAM_DESC	No description found for parameter
> > +typedef X_PARAM    	Excess function parameter
> > +typedef X_STRUCT	Excess struct member
> > +typedef FUN_PROTO    	cannot understand function prototype
> > +typedef DOC_FORMAT   	Incorrect use of kernel-doc format
> > +typedef BAD_LINE	bad line
> > +typedef AMBIGUOUS	Cannot understand.*\n on line
> > +typedef BOGUS_STRUCT	Cannot parse struct or union
> > +typedef DUPL_SEC	duplicate section name
> > +
> > +checker coccicheck
> > +cflags
> > +
> > +run sparse checkpatch checkdoc
> > +#run all
> > diff --git a/scripts/runchecks_help.txt b/scripts/runchecks_help.txt
> > new file mode 100644
> > index 0000000..a0a4a34
> > --- /dev/null
> > +++ b/scripts/runchecks_help.txt
> > @@ -0,0 +1,43 @@
> > +Usage: runchecks  [<options>] c_file [-- <c_parameters>]
> > +  - run code checkers in a conformant way.
> > +
> > +Options:
> > +  -h|--help	List this text
> > +  --list	List the different configured checkers and the list of interp=
reted
> check
> > +		types for each of them.
> > +  --		Separator between parameters to runchecks and compiler parameter=
s
> to be
> > +		passed directly to the checkers.
> > +  --run:[checker1[,checker2..]|all]
> > +		Override the default set of checkers to be run for each source file.
> By
> > +		default the checkers to run will be the intersection of the checkers
> > +		configured by ``run`` commands in the configuration file and the
> > +		checkers that is actually available on the machine. Use 'all'
> > +		to run all the configured checkers.
> > +  --color	Use coloring in the error and warning output. In this mode
> > +		output from checkers that are supported by typedefs but not
> > +		captured by any such will be highlighted in red to make it
> > +		easy to detect that a typedef rule is missing. See -t below.
> > +  -f		Force mode: force runchecks to run a full run in
> directories/trees
> > +		where runchecks does not find a	runchecks.cfg file. The
> default
> > +		behaviour is to skip running checkers in directories/trees
> > +		where no matching runchecks.cfg file is found either in the
> > +		source file directory or above.
> > +  -n		Ignore all runchecks.cfg files except the one in scripts,
> > +		which are used for basic runchecks configuration. This allows
> > +		an easy way to run a "bare" version of checking where all
> > +		issues are reported, even those intended to be suppressed.
> > +		Implicitly enables force mode.
> > +  -w		Behave as if 0 on exit from all checkers. Normally
> > +		runchecks will fail on the first checker to produce errors or
> > +		warnings, in fact anything that produces not suppressed
> > +		output on stderr. This is to make it easy to work interactively,
> > +		avoiding overlooking anything, but sometimes it is useful to
> > +		be able to produce a full report of status.
> > +  -t		Typedef setup mode: For checkers where runchecks enable typedefs=
:
> > +		Behaves as -w except for stderr output that is not captured
> > +		by any typedefs. This is a convenience mode while
> > +		fixing/improving typedef setup. Use with --color to get red
> > +		output for the statements to capture with new typedefs.
> > +  -v		Verbose output. Also enabled if called from make with V=3D1,
> > +		but it is useful to be able to only enable verbose mode for
> runchecks.
> > +  -d		Debugging output - more verbose.
>=20
