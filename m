Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:51941 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786Ab1EWIjk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:39:40 -0400
Received: by iwn34 with SMTP id 34so4568626iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:39:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Date: Mon, 23 May 2011 04:39:39 -0400
Message-ID: <BANLkTiny1XfELLD8g5FFieLdU045BGe_ZA@mail.gmail.com>
Subject: Re: [RFCv2 00/13] Kbuild: factor parser rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, David Gibson <david@gibson.dropbear.id.au>

Hi,

On Mon, May 23, 2011 at 4:10 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Hi,
> [...]
> A few notes:
>  - the parser should not include the lexer; however, this has the advantage to
>   avoid having to deals with the parser's header.
fixed in https://github.com/lacombar/linux-2.6/commits/kbuild-implicit-parser-rule.

new diffstat:

% git ds -M v2.6.39..HEAD
 scripts/Makefile.lib                               |   38 ++-
 scripts/dtc/Makefile                               |   23 -
 scripts/dtc/dtc-lexer.lex.c_shipped                |   59 +---
 scripts/dtc/dtc-parser.tab.c_shipped               |  116 +----
 scripts/dtc/dtc-parser.tab.h_shipped               |   11 +-
 scripts/genksyms/.gitignore                        |    7 +-
 scripts/genksyms/Makefile                          |   48 +--
 scripts/genksyms/keywords.gperf                    |    3 +
 ...{keywords.c_shipped => keywords.hash.c_shipped} |   96 ++--
 scripts/genksyms/lex.l                             |    4 +-
 .../genksyms/{lex.c_shipped => lex.lex.c_shipped}  |  359 +--------------
 .../{parse.c_shipped => parse.tab.c_shipped}       |  198 +-------
 .../{parse.h_shipped => parse.tab.h_shipped}       |    7 +-
 scripts/kconfig/.gitignore                         |    2 +-
 scripts/kconfig/Makefile                           |   31 +--
 scripts/kconfig/lkc.h                              |    4 +-
 scripts/kconfig/zconf.gperf                        |    2 +-
 scripts/kconfig/zconf.hash.c_shipped               |  273 +++++++-----
 scripts/kconfig/zconf.l                            |   20 +-
 .../{lex.zconf.c_shipped => zconf.lex.c_shipped}   |  493 +++++++++-----------
 scripts/kconfig/zconf.tab.c_shipped                |  102 ++---
 .../zconf.tab.h_shipped}                           |   96 ++--
 scripts/kconfig/zconf.y                            |   44 +-
 23 files changed, 668 insertions(+), 1368 deletions(-)

That should remove any incompatibilities with the upstream dtc tree.

 - Arnaud
