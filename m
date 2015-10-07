Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34707 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbbJGXQn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Oct 2015 19:16:43 -0400
From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Subject: [PATCH v4] kbuild: document recursive dependency limitation / resolution
Date: Wed,  7 Oct 2015 16:16:33 -0700
Message-Id: <1444259793-32486-1-git-send-email-mcgrof@do-not-panic.com>
In-Reply-To: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, mcgrof@suse.com, soos.mate@gmail.com, skl@det.ua.pt, iouliia@det.ua.pt, biere@jku.at, julia.lawall@lip6.fr, chidaph@gmail.com, wasowski@itu.dk, bergert@chalmers.se, mgorman@suse.de, vegard.nossum@gmail.com, kconfig-sat@googlegroups.com

From: "Luis R. Rodriguez" <mcgrof@suse.com>

Recursive dependency issues with kconfig are unavoidable due to
some limitations with kconfig, since these issues are recurring
provide a hint to the user how they can resolve these dependency
issues and also document why such limitation exists.

While at it also document a bit of future prospects of ways to
enhance Kconfig, including providing formal semantics and evaluation
of use of a SAT solver. If you're interested in this work or prospects
of it check out the kconfig-sat project wiki [0] and mailing list [1].

[0] http://kernelnewbies.org/KernelProjects/kconfig-sat
[1] https://groups.google.com/d/forum/kconfig-sat

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Bottomley <jbottomley@odin.com>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Paul Bolle <pebolle@tiscali.nl>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mate Soos <soos.mate@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
---
 Documentation/kbuild/Kconfig.recursion-issue-01 |  57 +++++++++
 Documentation/kbuild/Kconfig.recursion-issue-02 |  63 ++++++++++
 Documentation/kbuild/Kconfig.select-break       |  33 +++++
 Documentation/kbuild/kconfig-language.txt       | 161 ++++++++++++++++++++++++
 scripts/kconfig/symbol.c                        |   2 +
 5 files changed, 316 insertions(+)
 create mode 100644 Documentation/kbuild/Kconfig.recursion-issue-01
 create mode 100644 Documentation/kbuild/Kconfig.recursion-issue-02
 create mode 100644 Documentation/kbuild/Kconfig.select-break

diff --git a/Documentation/kbuild/Kconfig.recursion-issue-01 b/Documentation/kbuild/Kconfig.recursion-issue-01
new file mode 100644
index 000000000000..e8877db0461f
--- /dev/null
+++ b/Documentation/kbuild/Kconfig.recursion-issue-01
@@ -0,0 +1,57 @@
+# Simple Kconfig recursive issue
+# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#
+# Test with:
+#
+# make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-01 allnoconfig
+#
+# This Kconfig file has a simple recursive dependency issue. In order to
+# understand why this recursive dependency issue occurs lets consider what
+# Kconfig needs to address. We iterate over what Kconfig needs to address
+# by stepping through the questions it needs to address sequentially.
+#
+#  * What values are possible for CORE?
+#
+# CORE_BELL_A_ADVANCED selects CORE, which means that it influences the values
+# that are possible for CORE. So for example if CORE_BELL_A_ADVANCED is 'y',
+# CORE must be 'y' too.
+#
+#  * What influences CORE_BELL_A_ADVANCED ?
+#
+# As the name implies CORE_BELL_A_ADVANCED is an advanced feature of
+# CORE_BELL_A so naturally it depends on CORE_BELL_A. So if CORE_BELL_A is 'y'
+# we know CORE_BELL_A_ADVANCED can be 'y' too.
+#
+#   * What influences CORE_BELL_A ?
+#
+# CORE_BELL_A depends on CORE, so CORE influences CORE_BELL_A.
+#
+# But that is a problem, because this means that in order to determine
+# what values are possible for CORE we ended up needing to address questions
+# regarding possible values of CORE itself again. Answering the original
+# question of what are the possible values of CORE would make the kconfig
+# tools run in a loop. When this happens Kconfig exits and complains about
+# the "recursive dependency detected" error.
+#
+# Reading the Documentation/kbuild/Kconfig.recursion-issue-01 file it may be
+# obvious that an easy to solution to this problem should just be the removal
+# of the "select CORE" from CORE_BELL_A_ADVANCED as that is implicit already
+# since CORE_BELL_A depends on CORE. Recursive dependency issues are not always
+# so trivial to resolve, we provide another example below of practical
+# implications of this recursive issue where the solution is perhaps not so
+# easy to understand. Note that matching semantics on the dependency on
+# CORE also consist of a solution to this recursive problem.
+
+mainmenu "Simple example to demo kconfig recursive dependency issue"
+
+config CORE
+	tristate
+
+config CORE_BELL_A
+	tristate
+	depends on CORE
+
+config CORE_BELL_A_ADVANCED
+	tristate
+	depends on CORE_BELL_A
+	select CORE
diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
new file mode 100644
index 000000000000..b9fd56c4b57e
--- /dev/null
+++ b/Documentation/kbuild/Kconfig.recursion-issue-02
@@ -0,0 +1,63 @@
+# Cumulative Kconfig recursive issue
+# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#
+# Test with:
+#
+# make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
+#
+# The recursive limitations with Kconfig has some non intuitive implications on
+# kconfig sematics which are documented here. One known practical implication
+# of the recursive limitation is that drivers cannot negate features from other
+# drivers if they share a common core requirement and use disjoint semantics to
+# annotate those requirements, ie, some drivers use "depends on" while others
+# use "select". For instance it means if a driver A and driver B share the same
+# core requirement, and one uses "select" while the other uses "depends on" to
+# annotate this, all features that driver A selects cannot now be negated by
+# driver B.
+#
+# A perhaps not so obvious implication of this is that, if semantics on these
+# core requirements are not carefully synced, as drivers evolve features
+# they select or depend on end up becoming shared requirements which cannot be
+# negated by other drivers.
+#
+# The example provided in Documentation/kbuild/Kconfig.recursion-issue-02
+# describes a simple driver core layout of example features a kernel might
+# have. Let's assume we have some CORE functionality, then the kernel has a
+# series of bells and whistles it desires to implement, its not so advanced so
+# it only supports bells at this time: CORE_BELL_A and CORE_BELL_B. If
+# CORE_BELL_A has some advanced feature CORE_BELL_A_ADVANCED which selects
+# CORE_BELL_A then CORE_BELL_A ends up becoming a common BELL feature which
+# other bells in the system cannot negate. The reason for this issue is
+# due to the disjoint use of semantics on expressing each bell's relationship
+# with CORE, one uses "depends on" while the other uses "select". Another
+# more important reason is that kconfig does not check for dependencies listed
+# under 'select' for a symbol, when such symbols are selected kconfig them
+# as mandatory required symbols. For more details on the heavy handed nature
+# of select refer to Documentation/kbuild/Kconfig.select-break
+#
+# To fix this the "depends on CORE" must be changed to "select CORE", or the
+# "select CORE" must be changed to "depends on CORE".
+#
+# For an example real world scenario issue refer to the attempt to remove
+# "select FW_LOADER" [0], in the end the simple alternative solution to this
+# problem consisted on matching semantics with newly introduced features.
+#
+# [0] http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
+
+mainmenu "Simple example to demo cumulative kconfig recursive dependency implication"
+
+config CORE
+	tristate
+
+config CORE_BELL_A
+	tristate
+	depends on CORE
+
+config CORE_BELL_A_ADVANCED
+	tristate
+	select CORE_BELL_A
+
+config CORE_BELL_B
+	tristate
+	depends on !CORE_BELL_A
+	select CORE
diff --git a/Documentation/kbuild/Kconfig.select-break b/Documentation/kbuild/Kconfig.select-break
new file mode 100644
index 000000000000..365ceb3424b1
--- /dev/null
+++ b/Documentation/kbuild/Kconfig.select-break
@@ -0,0 +1,33 @@
+# Select broken dependency issue
+# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#
+# Test with:
+#
+# make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.select-break menuconfig
+#
+# kconfig will not complain and enable this layout for configuration. This is
+# currently a feature of kconfig, given select was designed to be heavy handed.
+# Kconfig currently does not check the list of symbols listed on a symbol's
+# "select" list, this is done on purpose to help load a set of known required
+# symbols. Because of this use of select should be used with caution. An
+# example of this issue is below.
+#
+# The option B and C are clearly contradicting with respect to A.
+# However, when A is set, C can be set as well because Kconfig does not
+# visit the dependencies of the select target (in this case B).  And since
+# Kconfig does not visit the dependencies, it breaks the dependencies of B
+# (!A).
+
+mainmenu "Simple example to demo kconfig select broken dependency issue"
+
+config A
+	bool "CONFIG A"
+
+config B
+	bool "CONFIG B"
+	depends on !A
+
+config C
+	bool "CONFIG C"
+	depends on A
+	select B
diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 350f733bf2c7..c52856da0cad 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -393,3 +393,164 @@ config FOO
 	depends on BAR && m
 
 limits FOO to module (=m) or disabled (=n).
+
+Kconfig recursive dependency limitations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If you've hit the Kconfig error: "recursive dependency detected" you've run
+into a recursive dependency issue with Kconfig, a recursive dependency can be
+summarized as a circular dependency. The kconfig tools need to ensure that
+Kconfig files comply with specified configuration requirements. In order to do
+that kconfig must determine the values that are possible for all Kconfig
+symbols, this is currently not possible if there is a circular relation
+between two or more Kconfig symbols. For more details refer to the "Simple
+Kconfig recursive issue" subsection below. Kconfig does not do recursive
+dependency resolution; this has a few implications for Kconfig file writers.
+We'll first explain why this issues exists and then provide an example
+technical limitation which this brings upon Kconfig developers. Eager
+developers wishing to try to address this limitation should read the next
+subsections.
+
+Simple Kconfig recursive issue
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Read: Documentation/kbuild/Kconfig.recursion-issue-01
+
+Test with:
+
+make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-01 allnoconfig
+
+Cumulative Kconfig recursive issue
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Read: Documentation/kbuild/Kconfig.recursion-issue-02
+
+Test with:
+
+make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
+
+Practical solutions to kconfig recursive issue
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Developers who run into the recursive Kconfig issue have three options
+at their disposal. We document them below and also provide a list of
+historical issues resolved through these different solutions.
+
+  a) Remove any superfluous "select FOO" or "depends on FOO"
+  b) Match dependency semantics:
+	b1) Swap all "select FOO" to "depends on FOO" or,
+	b2) Swap all "depends on FOO" to "select FOO"
+
+The resolution to a) can be tested with the sample Kconfig file
+Documentation/kbuild/Kconfig.recursion-issue-01 through the removal
+of the "select CORE" from CORE_BELL_A_ADVANCED as that is implicit already
+since CORE_BELL_A depends on CORE. At times it may not be possible to remove
+some dependency criteria, for such cases you can work with solution b).
+
+The two different resolutions for b) can be tested in the sample Kconfig file
+Documentation/kbuild/Kconfig.recursion-issue-02.
+
+Below is a list of examples of prior fixes for these types of recursive issues;
+all errors appear to involve one or more select's and one or more "depends on".
+
+commit          fix
+======          ===
+06b718c01208    select A -> depends on A
+c22eacfe82f9    depends on A -> depends on B
+6a91e854442c    select A -> depends on A
+118c565a8f2e    select A -> select B
+f004e5594705    select A -> depends on A
+c7861f37b4c6    depends on A -> (null)
+80c69915e5fb    select A -> (null)              (1)
+c2218e26c0d0    select A -> depends on A        (1)
+d6ae99d04e1c    select A -> depends on A
+95ca19cf8cbf    select A -> depends on A
+8f057d7bca54    depends on A -> (null)
+8f057d7bca54    depends on A -> select A
+a0701f04846e    select A -> depends on A
+0c8b92f7f259    depends on A -> (null)
+e4e9e0540928    select A -> depends on A        (2)
+7453ea886e87    depends on A > (null)           (1)
+7b1fff7e4fdf    select A -> depends on A
+86c747d2a4f0    select A -> depends on A
+d9f9ab51e55e    select A -> depends on A
+0c51a4d8abd6    depends on A -> select A        (3)
+e98062ed6dc4    select A -> depends on A        (3)
+91e5d284a7f1    select A -> (null)
+
+(1) Partial (or no) quote of error.
+(2) That seems to be the gist of that fix.
+(3) Same error.
+
+Future kconfig work
+~~~~~~~~~~~~~~~~~~~
+
+Work on kconfig is welcomed on both areas of clarifying semantics and on
+evaluating the use of a full SAT solver for it. A full SAT solver can be
+desirable to enable more complex dependency mappings and / or queries,
+for instance on possible use case for a SAT solver could be that of handling
+the current known recursive dependency issues. It is not known if this would
+address such issues but such evaluation is desirable. If support for a full SAT
+solver proves too complex or that it cannot address recursive dependency issues
+Kconfig should have at least clear and well defined semantics which also
+addresses and documents limitations or requirements such as the ones dealing
+with recursive dependencies.
+
+Further work on both of these areas is welcomed on Kconfig. We elaborate
+on both of these in the next two subsections.
+
+Semantics of Kconfig
+~~~~~~~~~~~~~~~~~~~~
+
+The use of Kconfig is broad, Linux is now only one of Kconfig's users:
+one study has completed a broad analysis of Kconfig use in 12 projects [0].
+Despite its widespread use, and although this document does a reasonable job
+in documenting basic Kconfig syntax a more precise definition of Kconfig
+semantics is welcomed. One project deduced Kconfig semantics through
+the use of the xconfig configurator [1]. Work should be done to confirm if
+the deduced semantics matches our intended Kconfig design goals.
+
+Having well defined semantics can be useful for tools for practical
+evaluation of depenencies, for instance one such use known case was work to
+express in boolean abstraction of the inferred semantics of Kconfig to
+translate Kconfig logic into boolean formulas and run a SAT solver on this to
+find dead code / features (always inactive), 114 dead features were found in
+Linux using this methodology [1] (Section 8: Threats to validity).
+
+Confirming this could prove useful as Kconfig stands as one of the the leading
+industrial variability modeling languages [1] [2]. Its study would help
+evaluate practical uses of such languages, their use was only theoretical
+and real world requirements were not well understood. As it stands though
+only reverse engineering techniques have been used to deduce semantics from
+variability modeling languages such as Kconfig [3].
+
+[0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
+[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+[2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
+[3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
+
+Full SAT solver for Kconfig
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Although SAT solvers [0] haven't yet been used by Kconfig directly, as noted in
+the previous subsection, work has been done however to express in boolean
+abstraction the inferred semantics of Kconfig to translate Kconfig logic into
+boolean formulas and run a SAT solver on it [1]. Another known related project
+is CADOS [2] (former VAMOS [3]) and the tools, mainly undertaker [4], which has
+been introduced first with [5].  The basic concept of undertaker is to exract
+variability models from Kconfig, and put them together with a propositional
+formula extracted from CPP #ifdefs and build-rules into a SAT solver in order
+to find dead code, dead files, and dead symbols. If using a SAT solver is
+desirable on Kconfig one approach would be to evaluate repurposing such efforts
+somehow on Kconfig. There is enough interest from mentors of existing projects
+to not only help advise how to integrate this work upstream but also help
+maintain it long term. Interested developers should visit:
+
+http://kernelnewbies.org/KernelProjects/kconfig-sat
+
+[0] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
+[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+[2] https://cados.cs.fau.de
+[3] https://vamos.cs.fau.de
+[4] https://undertaker.cs.fau.de
+[5] https://www4.cs.fau.de/Publications/2011/tartler_11_eurosys.pdf
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 50878dc025a5..25cf0c2c0c79 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1116,6 +1116,8 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		if (stack->sym == last_sym)
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
+			fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
+			fprintf(stderr, "subsection \"Kconfig recursive dependency limitations\"\n");
 		if (stack->expr) {
 			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
 				prop->file->name, prop->lineno,
-- 
2.4.3

