Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:34683 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbbJDNmx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 Oct 2015 09:42:53 -0400
Date: Sun, 4 Oct 2015 15:42:47 +0200
From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: [PATCH v3] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20151004134247.GA7528@nebuchadnezzar>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1443026498-15081-1-git-send-email-mcgrof@do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1443026498-15081-1-git-send-email-mcgrof@do-not-panic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, mcgrof@suse.com, soos.mate@gmail.com, skl@det.ua.pt, iouliia@det.ua.pt, a21394@alunos.det.ua.pt, a21540@alunos.det.ua.pt, biere@jku.at

Hi Luis,

I finally found some time to read your patch.  Thanks for doing this
work in such great detail.

What I miss in the text is a general discussion of the widespread use of
selects.  In my opinion, selects should be (like gotos) considered
harmful:

First, selects ignore the user selection and all feature constraints:  a
symbol can be selected regardless if this breaks the constraints induced
by dependencies.  Second, in my experience, selects are oftentimes used
to make manual configuration of the kernel easier, since a given symbol
is visible to the user even when the symbol's dependency is not yet
selected.  In contrast to a select, a symbol using a dependency is only
visible to the user when its dependency are satisfied.  I see it as a
decision between being semantically correct (depends) and being easy to
configure/user friendly (select).

The danger of using selects is already mentioned in the description of
selects, but I believe that it's good to raise awareness on top of what
you already wrote down.

On Sep 23 '15 09:41, Luis R. Rodriguez wrote:
> From: "Luis R. Rodriguez" <mcgrof@suse.com>
> 
> Recursive dependency issues with kconfig are unavoidable due to
> some limitations with kconfig, since these issues are recurring
> provide a hint to the user how they can resolve these dependency
> issues and also document why such limitation exists.
> 
> While at it also document a bit of future prospects of ways to
> enhance Kconfig, including providing formal semantics and evaluation
> of use of a SAT solver.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: James Bottomley <jbottomley@odin.com>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Paul Bolle <pebolle@tiscali.nl>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mate Soos <soos.mate@gmail.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
> ---
> 
> This v3 builds up on requests on the v2 patch [0] by Josh first to clarify use
> of a SAT solver remains purely theoretical to address the known recursive
> dependency issues, and lastly then feedback by Paul to clarify why we
> have the recursive dependency issues. Since I still think the practical
> implications I was trying to clarify are important for developers to be
> aware of I've separated that into a different subsection. Lastly, I've added
> two subsections so that folks interested in advancing Kconfig can dig into
> to try to help address the feasibility of using a SAT solver with Kconfig.
> 
> I should also note that prospect use of SAT solvers on Linux is not only
> limited to Kconfig, however some areas may obviously require smaller time
> resolution constraints. For instance another theoretical area is in the use of
> kernel call site use of select_idle_sibling() where the schedular checks if the
> overall compute and NUMA accesses of the system would be improved if the source
> tasks were migrated to another target CPU. Such use would require a resolution
> in the thousands of CPU cycles time frame, and the size of the problems will
> vary depending on the number of CPUs, topology, and workloads. In addition
> workload parameters in particular can vary extremely fast, its not even certain
> yet if these problems can be represented as a SAT problem at the moment.
> Another optimization consideration would be the requirement for scheduling
> decisions to have all data locally avaiable, offloading such problems would
> very likely not be viable solution, for instance, so fully hardware assisted
> SAT solvers may be required. Hardware assisted SAT solutions are known to exist
> but R&D for it is still in early stages [1] [2] [3].
> 
> [0] http://lkml.kernel.org/r/1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com
> [1] https://dl.acm.org/citation.cfm?id=1025035
> [2] http://sweet.ua.pt/iouliia/Papers/2004/SSPA_FPL.pdf
> [3] http://link.springer.com/chapter/10.1007/978-3-540-71431-6_32
> 
>  Documentation/kbuild/Kconfig.recursion-issue-01 |  13 ++
>  Documentation/kbuild/Kconfig.recursion-issue-02 |  17 ++
>  Documentation/kbuild/kconfig-language.txt       | 233 ++++++++++++++++++++++++
>  scripts/kconfig/symbol.c                        |   2 +
>  4 files changed, 265 insertions(+)
>  create mode 100644 Documentation/kbuild/Kconfig.recursion-issue-01
>  create mode 100644 Documentation/kbuild/Kconfig.recursion-issue-02
> 
> diff --git a/Documentation/kbuild/Kconfig.recursion-issue-01 b/Documentation/kbuild/Kconfig.recursion-issue-01
> new file mode 100644
> index 000000000000..a097973025e7
> --- /dev/null
> +++ b/Documentation/kbuild/Kconfig.recursion-issue-01
> @@ -0,0 +1,13 @@
> +mainmenu "Simple example to demo kconfig recursive dependency issue"
> +
> +config CORE
> +	tristate
> +
> +config CORE_BELL_A
> +	tristate
> +	depends on CORE
> +
> +config CORE_BELL_A_ADVANCED
> +	tristate
> +	depends on CORE_BELL_A
> +	select CORE
> diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
> new file mode 100644
> index 000000000000..b6282623336f
> --- /dev/null
> +++ b/Documentation/kbuild/Kconfig.recursion-issue-02
> @@ -0,0 +1,17 @@
> +mainmenu "Simple example to demo cumulative kconfig recursive dependency implication"
> +
> +config CORE
> +	tristate
> +
> +config CORE_BELL_A
> +	tristate
> +	depends on CORE
> +
> +config CORE_BELL_A_ADVANCED
> +	tristate
> +	select CORE_BELL_A
> +
> +config CORE_BELL_B
> +	tristate
> +	depends on !CORE_BELL_A
> +	select CORE

Switching between files to read one text can be confusing.  Hence, it
might be easier for a reader to understand the recursive issue when the
problem descriptions of both examples were placed in the corresponding
files.

> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 350f733bf2c7..3b51d6b8c14f 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -393,3 +393,236 @@ config FOO
>  	depends on BAR && m
>  
>  limits FOO to module (=m) or disabled (=n).
> +
> +Kconfig recursive dependency limitations
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If you've hit the Kconfig error: "recursive dependency detected" you've run
> +into a recursive dependency issue with Kconfig. Kconfig does not do recursive

It seems like a good point here to define what you mean by ``recursive
dependency'', that's something I miss in the text.

> +dependency resolution; this has a few implications for Kconfig file writers.
> +We'll first explain why this issues exists and then provide an example
> +technical limitation which this brings upon Kconfig developers. Eager
> +developers wishing to try to address this limitation should read the
> +next subsection.
> +
> +The kconfig tools need to ensure that their input complies with the
> +configuration requirements specified in the various Kconfig files. In
> +order to do that they must determine the values that are possible for
> +all Kconfig symbols. And that is not possible if there is a circular
> +relation between two or more Kconfig symbols. We'll review the simplest
    
    ^ circular vs recursive ... I assume you mean the same thing

> +type of recursive dependency issue with an example and explain why the
> +recursive dependency exists. Consider the example Kconfig file
> +Documentation/kbuild/Kconfig.recursion-issue-01, you can test it with.
> +

As written before, I prefer to have the problem descriptions /
explanations of both examples in their files.  Below, a more general
text would be nice:
    How does the problem look like?
    Why and how do such situations occur?
    How can the recursions be resolved?

Thereby, you could merge Simple and Cumulative and then jump to how they
can be fixed.

> +Simple Kconfig recursive issue
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Read: Documentation/kbuild/Kconfig.recursion-issue-01
> +
> +Test with:
> +
> +make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-01 allnoconfig
> +
> +This Kconfig file has a simple recursive dependency issue. In order to
> +understand why this recursive dependency issue occurs lets consider what
> +Kconfig needs to address. We iterate over what Kconfig needs to address
> +by stepping through the questions it needs to address sequentially.
> +
> + * What values are possible for CORE?
> +
> +CORE_BELL_A_ADVANCED selects CORE, which means that it influences the values
> +that are possible for CORE. So for example if CORE_BELL_A_ADVANCED is 'y',
> +CORE must be 'y' too.
> +
> + * What influences CORE_BELL_A_ADVANCED ?
> +
> +As the name implies CORE_BELL_A_ADVANCED is an advanced feature of CORE_BELL_A
> +so naturally it depends on CORE_BELL_A. So if CORE_BELL_A is 'y' we know
> +CORE_BELL_A_ADVANCED can be 'y' too.
> +
> +  * What influences CORE_BELL_A ?
> +
> +CORE_BELL_A depends on CORE, so CORE influences CORE_BELL_A.
> +
> +But that is a problem, because this means that in order to determine
> +what values are possible for CORE we ended up needing to address questions
> +regarding possible values of CORE itself again. Answering the original
> +question of what are the possible values of CORE would make the kconfig
> +tools run in a loop. When this happens Kconfig exits and complains about
> +the "recursive dependency detected" error.
> +
> +Reading the Documentation/kbuild/Kconfig.recursion-issue-01 file it may be
> +obvious that an easy to solution to this problem should just be the removal
> +of the "select CORE" from CORE_BELL_A_ADVANCED as that is implicit already
> +since CORE_BELL_A depends on CORE. Recursive dependency issues are not always
> +so trivial to resolve, we provide another example below of practical
> +implications of this recursive issue where the solution is perhaps not so
> +easy to understand. Note that matching semantics on the dependency on
> +CORE also consist of a solution to this recursive problem.
> +
> +Cumulative Kconfig recursive issue
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Read: Documentation/kbuild/Kconfig.recursion-issue-02
> +
> +Test with:
> +
> +make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
> +
> +The recursive limitations with Kconfig has some non intuitive implications
> +on kconfig sematics which are documented in this subsection. One known
> +practical implication of the recursive limitation is that drivers cannot
> +negate features from other drivers if they share a common core requirement and
> +use disjoint semantics to annotate those requirements, ie, some drivers use
> +"depends on" while others use "select". For instance it means if a driver A
> +and driver B share the same core requirement, and one uses "select" while the
> +other uses "depends on" to annotate this, all features that driver A selects
> +cannot now be negated by driver B.
> +
> +A perhaps not so obvious implication of this is that, if semantics on these
> +core requirements are not carefully synced, as drivers evolve features
> +they select or depend on end up becoming shared requirements which cannot be
> +negated by other drivers.
> +
> +The example provided in Documentation/kbuild/Kconfig.recursion-issue-02
> +describes a simple driver core layout of example features a kernel might
> +have. Let's assume we have some CORE functionality, then the kernel has a
> +series of bells and whistles it desires to implement, its not so advanced so
> +it only supports bells at this time: CORE_BELL_A and CORE_BELL_B. If
> +CORE_BELL_A has some advanced feature CORE_BELL_A_ADVANCED which selects
> +CORE_BELL_A then CORE_BELL_A ends up becoming a common BELL feature which
> +other bells in the system cannot negate. The reason for this issue is
> +due to the disjoint use of semantics on expressing each bell's relationship
> +with CORE, one uses "depends on" while the other uses "select".
> +
> +To fix this the "depends on CORE" must be changed to "select CORE", or the
> +"select CORE" must be changed to "depends on CORE".
> +
> +For an example real world scenario issue refer to the attempt to remove
> +"select FW_LOADER" [0], in the end the simple alternative solution to this
> +problem consisted on matching semantics with newly introduced features.
> +
> +[0] http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
> +
> +Practical solutions to kconfig recursive issue
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Developers who run into the recursive Kconfig issue have three options
> +at their disposal. We document them below and also provide a list of
> +historical issues resolved through these different solutions.
> +
> +  a) Remove any superfluous "select FOO" or "depends on FOO"
> +  b) Match dependency semantics:
> +	b1) Swap all "select FOO" to "depends on FOO" or,
> +	b2) Swap all "depends on FOO" to "select FOO"
> +
> +The resolution to a) can be tested with the sample Kconfig file
> +Documentation/kbuild/Kconfig.recursion-issue-01 through the removal
> +of the "select CORE" from CORE_BELL_A_ADVANCED as that is implicit already
> +since CORE_BELL_A depends on CORE. At times it may not be possible to remove
> +some dependency criteria, for such cases you can work with solution b).
> +
> +The two different resolutions for b) can be tested in the sample Kconfig file
> +Documentation/kbuild/Kconfig.recursion-issue-02.
> +
> +Below is a list of examples of prior fixes for these types of recursive issues;
> +all errors appear to involve one or more select's and one or more "depends on".
> +
> +commit          fix
> +======          ===
> +06b718c01208    select A -> depends on A
> +c22eacfe82f9    depends on A -> depends on B
> +6a91e854442c    select A -> depends on A
> +118c565a8f2e    select A -> select B
> +f004e5594705    select A -> depends on A
> +c7861f37b4c6    depends on A -> (null)
> +80c69915e5fb    select A -> (null)              (1)
> +c2218e26c0d0    select A -> depends on A        (1)
> +d6ae99d04e1c    select A -> depends on A
> +95ca19cf8cbf    select A -> depends on A
> +8f057d7bca54    depends on A -> (null)
> +8f057d7bca54    depends on A -> select A
> +a0701f04846e    select A -> depends on A
> +0c8b92f7f259    depends on A -> (null)
> +e4e9e0540928    select A -> depends on A        (2)
> +7453ea886e87    depends on A > (null)           (1)
> +7b1fff7e4fdf    select A -> depends on A
> +86c747d2a4f0    select A -> depends on A
> +d9f9ab51e55e    select A -> depends on A
> +0c51a4d8abd6    depends on A -> select A        (3)
> +e98062ed6dc4    select A -> depends on A        (3)
> +91e5d284a7f1    select A -> (null)
> +
> +(1) Partial (or no) quote of error.
> +(2) That seems to be the gist of that fix.
> +(3) Same error.

^ It's awesome to have list like above.

> +
> +Future kconfig work
> +~~~~~~~~~~~~~~~~~~~
> +
> +Work on kconfig is welcomed on both areas of clarifying semantics and on
> +evaluating the use of a full SAT solver for it. A full SAT solver can be
> +desirable to enable more complex dependency mappings and / or queries,
> +for instance on possible use case for a SAT solver could be that of handling
> +the current known recursive dependency issues. It is not known if this would
> +address such issues but such evaluation is desirable. If support for a full SAT
> +solver proves too complex or that it cannot address recursive dependency issues
> +Kconfig should have at least clear and well defined semantics which also
> +addresses and documents limitations or requirements such as the ones dealing
> +with recursive dependencies.
> +
> +Further work on both of these areas is welcomed on Kconfig. We elaborate
> +on both of these in the next two subsections.
> +
> +Semantics of Kconfig
> +~~~~~~~~~~~~~~~~~~~~
> +
> +The use of Kconfig is broad, Linux is now only one of Kconfig's users:
> +one study has completed a broad analysis of Kconfig use in 12 projects [0].
> +Despite its widespread use, and although this document does a reasonable job
> +in documenting basic Kconfig syntax a more precise definition of Kconfig
> +semantics is welcomed. One project deduced Kconfig semantics through
> +the use of the xconfig configurator [1]. Work should be done to confirm if
> +the deduced semantics matches our intended Kconfig design goals.
> +
> +Having well defined semantics can be useful for tools for practical
> +evaluation of depenencies, for instance one such use known case was work to
> +express in boolean abstraction of the inferred semantics of Kconfig to
> +translate Kconfig logic into boolean formulas and run a SAT solver on this to
> +find dead code / features (always inactive), 114 dead features were found in
> +Linux using this methodology [1] (Section 8: Threats to validity).
> +
> +Confirming this could prove useful as Kconfig stands as one of the the leading
> +industrial variability modeling languages [1] [2]. Its study would help
> +evaluate practical uses of such languages, their use was only theoretical
> +and real world requirements were not well understood. As it stands though
> +only reverse engineering techniques have been used to deduce semantics from
> +variability modeling languages such as Kconfig [3].
> +
> +[0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
> +[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> +[2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
> +[3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf

A highly related project is CADOS [1] (former VAMOS [2]) and the tools,
mainly undertaker [3], which has been introduced first with [4].  The
basic concept of undertaker is to exract variability models from
Kconfig, and put them together with a propositional formula extracted
from CPP #ifdefs and build-rules into a SAT solver in order to find dead
code, dead files, and dead symbols.

[1] https://cados.cs.fau.de
[2] https://vamos.cs.fau.de
[3] https://undertaker.cs.fau.de
[4] https://www4.cs.fau.de/Publications/2011/tartler_11_eurosys.pdf

> +Full SAT solver for Kconfig
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Although SAT solvers [0] haven't yet been used by Kconfig directly, as noted in
> +the previous subsection, work has been done however to express in boolean
> +abstraction the inferred semantics of Kconfig to translate Kconfig logic into
> +boolean formulas and run a SAT solver on it [1]. If using a SAT solver is
> +desirable on Kconfig one approach would be to evaluate repurposing such effort
> +somehow on Kconfig. The 3-year Mancoosi research project [1] challenged
> +researchers and developers with solutions for software package resolution
> +dependencies requiring free software licenses for proposed solutions, some of
> +the solutions proposed used SAT solvers, one of which was CryManSolver which
> +used CryptoMiniSat [3] [4] as backend (a SAT solver in itself). CryptoMiniSat
> +remains of the only SAT solvers which aims to be fully open that also has a
> +relatively clean C++ / Python interface. Evaluation of CryptoMiniSat for use
> +with Kconfig is desirable.
> +
> +[0] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
> +[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> +[2] http://mancoosi.org/
> +[3] http://www.msoos.org/cryptominisat4/
> +[4] https://github.com/msoos/cryptominisat/

As mentioned in a different mail thread, undertaker uses PicoSAT [5].  I
am no expert in SAT solving, but PicoSAT works reliably fast, it is
written in C and also ships PicoMUS to generate a Minimally
Unsatisfiable Subformula.  We use it the MUS to understand which Kconfig
symbols contribute to a boolean contradiction when analyzing dead
features or dead code, etc.  It is a powerful tool and could be
interesting especially in the context of Kconfig.

Hence, I suggest to add [5] to list above to consider it in future
evaluations.

[5] http://fmv.jku.at/picosat/

Thanks again for all your work,
  Valentin
