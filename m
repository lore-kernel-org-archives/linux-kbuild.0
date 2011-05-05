Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61982 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271Ab1EECDa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:30 -0400
Received: by iwn34 with SMTP id 34so1461966iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:30 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 0/9] Kbuild: factor parser rules
Date: Wed,  4 May 2011 22:03:15 -0400
Message-Id: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi Folks,

I noticed recently that several program under scripts/ implement their own set
of gperf/lex/yacc rules. The following patchset aims at factoring all these
targets into `scripts/Makefiles.lib'. Patches do the job for `genksyms' and
`kconfig', `dtc' remains to be done.

I am not really happy with the file naming, in particular the lexer which breaks
convention. I would prefer something ala:
 - parser: %.tab.c
 - lexer: %.lex.c
 - hash: %.hash.c

Moreover, I'd prefer to build the lexer and parser as a different compilation
unit, but that might be done later on.

The following also allows to automatically regen the %_shipped file upon
modification of its associated prerequiresite, provided REGENERATE_PARSERS is
defined.

The diff may look mistakenly large as I had to shuffle things around to make
them match the same pattern.

Known issue: there should be 2 new warnings introduced in `genksyms', only
compile tested so far (only on tools, not on the full kernel), in particular,
`gperf' options may need to be tuned.

Patches are based on v2.6.38. Not for merge, so not signed off on purpose.

Comments welcome!
 - Arnaud

Arnaud Lacombe (9):
  genksyms: rename parser files
  genksyms: finalize rename
  genksyms: pass hash and lookup functions name and target language
    though the input file
  genksyms: regen parser
  kconfig: constify `kconf_id_lookup'
  kconfig: regen parsers
  kbuild: merge parser generation rules
  kconfig: regen parser
  genksyms: regen parser

 scripts/Makefile.lib                     |   31 +-
 scripts/genksyms/.gitignore              |    6 +-
 scripts/genksyms/Makefile                |   43 +-
 scripts/genksyms/genksyms.c              |   11 +-
 scripts/genksyms/genksyms.gperf          |   59 +
 scripts/genksyms/genksyms.hash.c_shipped |  220 +++
 scripts/genksyms/genksyms.l              |  408 +++++
 scripts/genksyms/genksyms.tab.c_shipped  | 2324 +++++++++++++++++++++++++
 scripts/genksyms/genksyms.y              |  475 ++++++
 scripts/genksyms/keywords.c_shipped      |  220 ---
 scripts/genksyms/keywords.gperf          |   56 -
 scripts/genksyms/lex.c_shipped           | 2709 ------------------------------
 scripts/genksyms/lex.genksyms.c_shipped  | 2242 ++++++++++++++++++++++++
 scripts/genksyms/lex.l                   |  409 -----
 scripts/genksyms/parse.c_shipped         | 2353 --------------------------
 scripts/genksyms/parse.h_shipped         |  139 --
 scripts/genksyms/parse.y                 |  473 ------
 scripts/kconfig/Makefile                 |   25 -
 scripts/kconfig/lex.zconf.c_shipped      |   26 +-
 scripts/kconfig/zconf.gperf              |    2 +-
 scripts/kconfig/zconf.hash.c_shipped     |  273 ++--
 scripts/kconfig/zconf.l                  |    4 +-
 scripts/kconfig/zconf.tab.c_shipped      |   32 +-
 scripts/kconfig/zconf.y                  |    8 +-
 24 files changed, 5959 insertions(+), 6589 deletions(-)
 create mode 100644 scripts/genksyms/genksyms.gperf
 create mode 100644 scripts/genksyms/genksyms.hash.c_shipped
 create mode 100644 scripts/genksyms/genksyms.l
 create mode 100644 scripts/genksyms/genksyms.tab.c_shipped
 create mode 100644 scripts/genksyms/genksyms.y
 delete mode 100644 scripts/genksyms/keywords.c_shipped
 delete mode 100644 scripts/genksyms/keywords.gperf
 delete mode 100644 scripts/genksyms/lex.c_shipped
 create mode 100644 scripts/genksyms/lex.genksyms.c_shipped
 delete mode 100644 scripts/genksyms/lex.l
 delete mode 100644 scripts/genksyms/parse.c_shipped
 delete mode 100644 scripts/genksyms/parse.h_shipped
 delete mode 100644 scripts/genksyms/parse.y

-- 
1.7.3.4.574.g608b.dirty

