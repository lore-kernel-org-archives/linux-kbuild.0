Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:60142 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755020AbeASKQw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jan 2018 05:16:52 -0500
From: Knut Omang <knut.omang@oracle.com>
Subject: [PATCH v4 0/1] Support for generalized use of make C={1,2} via a wrapper program
Date: Fri, 19 Jan 2018 11:14:54 +0100
Message-Id: <cover.a7e2d48abd08947a9bb46ef5d18a8f33066cc40d.1516356501.git-series.knut.omang@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Knut Omang <knut.omang@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan <shuah@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, John Haxby <john.haxby@oracle.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Tom Saeger <tom.saeger@oracle.com>, Michal Marek <michal.lkml@markovi.net>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Julia Lawall <Julia.Lawall@lip6.fr>, =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>, =?UTF-8?q?=C3=85smund=20=C3=98stvold?= <asmund.ostvold@oracle.com>, Matthew Wilcox <willy@infradead.org>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, cocci@systeme.lip6.fr, Andrew Morton <akpm@linux-foundation.org>

This patch implements features to make it easier to run checkers on the
entire kernel as part of automatic and developer testing.

This is done by replacing the sparse specific setup for the C={1,2} variable
in the makefiles with setup for running scripts/runchecks, a new program that
can run any number of different "checkers". The behaviour of runchecks is
defined by simple conceptually global configuration in scripts/runchecks.cfg
which can be extended by local configuration applying to individual files,
directories or subtrees in the source.

The runchecks.cfg files are parsed according to this minimal language:

       # comments
       # "Global configuration in scripts/runchecks.cfg:
       checker <name>
       typedef NAME regex
       run <list of checkers or "all"

       # "local" configuration:
       line_len <n>
       except checkpatch_type [files ...]
       pervasive checkpatch_type1 [checkpatch_type2 ...]

With "make C=2" runchecks first parse the file scripts/runchecks.cfg, then
look for a file named 'runchecks.cfg' in the same directory as the source file.
If that file exists, it will be parsed and it's local configuration applied to
allow suppression on a per checker, per check and per file basis.
If a "local" configuration does not exist, either in the source directory or
above, make will simply silently ignore the file. This way the semantics
of "no in-tree runchecks.cfg file" is equivalent to a configuration where
all checks have been suppressed.

The idea is that the community can work to add runchecks.cfg files to
directories, serving both as documentation and as a way for subsystem
maintainers to enforce policies and individual tastes as well as TODOs and/or
priorities, to make it easier for newcomers to contribute in this area. By
ignoring directories/subtrees without such files, automation can start right
away as it is trivially possible to run errorless with C=2 for the entire
kernel.

For the checker maintainers this should be a benefit as well: new
or improved checks would generate new errors/warnings. With automatic testing
for the checkers, these new checks would generate error reports and cause
builds to fail. Adding the new check a 'pervasive' option at the top level or
even for specific files, marked with a "new check - please consider fixing" comment
or similar would make those builds pass while documenting and making the new check
more visible.

The patch includes documentation with some more details.

This patch has evolved from an earlier shell script implementation I made
as only a wrapper script around checkpatch. That version have been used for a
number of years on a driver project I worked on where we had automatic checkin
regression testing. I extended that to also run checkpatch to avoid having to
clean up frequent unintended whitespace changes and style violations from others...

I have also tested this on some directories I am familiar with.  The
result of that work is available in two patch sets of 10 and 11 patches.
I will post these fixes as separate patch sets later.

Version 3-1 of this set and related discussion can be found here:

   v3: https://lkml.org/lkml/2018/1/4/359
   v2: https://lkml.org/lkml/2017/12/16/343
   v1: https://lkml.org/lkml/2017/11/16/458

Changes from v3:
-----------------
* Used argparse for argument parsing
* Update 'make help' to reflect changes
* Added support for smatch
  (see https://blogs.oracle.com/linuxkernel/smatch-static-analysis-tool-overview,-by-dan-carpenter)
* Removed superfluous license statements
* Fixed a broken sys.stderr.write() statement in runchecks, as well as a few minor
  error handling improvements.
* Also fixed some python style issues reported by pep8/flake8

Changes from v2:
-----------------
* Squashed patches #1 and #2 from v2.
  Fixed a few spelling errors + some suggested text improvements
  in the docs.
* Shelved patch #3 as it's usefulness is not clear
* Removed patch #4-#5 as they were included here
  as examples for discussion
* rebased to v4.15-rc6

Changes from v1:
-----------------
Based on feedback, the implementation is completely rewritten and extended.
Instead of patches to checkpatch, and a sole checkpatch focus, it is now a
generic solution implemented in python, for any type of checkers, extendable
through some basic generic functionality, and for special needs by subclassing
the Checker class in the implementation.

This implementation fully supports checkpatch, sparse, smatch, and
checkdoc == kernel-doc -none, and also has been tested with coccicheck.
To facilitate the same mechanism of using check types to filter what
checks to be suppressed, I introduced the concept of "typedefs" which allows
runchecks to effectively augment the check type space of the checker in cases
where types either are not available at all (checkdoc) or where only a few
can be filtered out (sparse)

With this in place it also became almost trivial to make the look and feel similar
for sparse, smatch and checkdoc as for checkpatch, with some optional color support
too, to make fixing issues in the code, the goal of this whole exercise,
much more pleasant IMHO :-)

Thanks,
Knut

Knut Omang (1):
  runchecks: Generalize make C={1,2} to support multiple checkers

 Documentation/dev-tools/coccinelle.rst |  12 +-
 Documentation/dev-tools/index.rst      |   1 +-
 Documentation/dev-tools/runchecks.rst  | 215 +++++++-
 Documentation/dev-tools/sparse.rst     |  30 +-
 Documentation/kbuild/kbuild.txt        |   9 +-
 Makefile                               |  31 +-
 scripts/Makefile.build                 |   4 +-
 scripts/runchecks                      | 809 ++++++++++++++++++++++++++-
 scripts/runchecks.cfg                  | 166 +++++-
 9 files changed, 1255 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/dev-tools/runchecks.rst
 create mode 100755 scripts/runchecks
 create mode 100644 scripts/runchecks.cfg

base-commit: 30a7acd573899fd8b8ac39236eff6468b195ac7d
-- 
git-series 0.9.1
