Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:37029 "EHLO
	faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754666AbbGGKbd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jul 2015 06:31:33 -0400
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
Subject: [PATCH v2 0/2] kconfig: warn of unhandled characters in Kconfig commands
Date: Tue,  7 Jul 2015 12:31:15 +0200
Message-Id: <cover.1436264921.git.andreas.ruprecht@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>, Andreas Ruprecht <andreas.ruprecht@fau.de>

This patchset changes the lexer file to emit a warning if any unhandled
characters are found in the input. So far, Kconfig options like

 +config FOO
    bool
    [...]

(note the wrong '+'!) were parsed without a warning. As simply adding a
warning for '.' produces lots of warnings as occasionally '---help---'
is used instead of 'help' (and thus '-' is recognized as an unhandled
character), we need to handle '---help---' separately.


Andreas Ruprecht (2):
  kconfig: warn of unhandled characters in Kconfig commands
  kconfig: Regenerate shipped zconf.{hash,lex}.c files

 scripts/kconfig/zconf.gperf          |   1 +
 scripts/kconfig/zconf.hash.c_shipped |  58 +++++++++--------
 scripts/kconfig/zconf.l              |  18 ++++--
 scripts/kconfig/zconf.lex.c_shipped  | 120 +++++++++++++++++++----------------
 4 files changed, 110 insertions(+), 87 deletions(-)

-- 
1.9.1

