Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57301 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751983Ab1JKKNH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Oct 2011 06:13:07 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 0/3] genksyms: Ignore changes to internal files
Date: Tue, 11 Oct 2011 12:12:46 +0200
Message-Id: <1318327969-24807-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi,

this series teaches genksyms to ignore changes to internal files (those
defined in the source file itself). See patch 2/3 for the main part.

Michal


Michal Marek (3):
  genksyms: Minor parser cleanup
  genksyms: Do not expand internal types
  genksyms: Regenerate lexer and parser

 scripts/genksyms/genksyms.c          |    3 +-
 scripts/genksyms/genksyms.h          |    4 +-
 scripts/genksyms/lex.l               |    8 +
 scripts/genksyms/lex.lex.c_shipped   |   12 +-
 scripts/genksyms/parse.tab.c_shipped |  645 ++++++++++++++++++----------------
 scripts/genksyms/parse.tab.h_shipped |    7 +-
 scripts/genksyms/parse.y             |   40 ++-
 7 files changed, 393 insertions(+), 326 deletions(-)

-- 
1.7.6.1

