Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:51855 "EHLO
	faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755256AbbGCMzp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 08:55:45 -0400
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
Subject: [PATCH 0/2] kconfig: warn of unhandled characters in statements
Date: Fri,  3 Jul 2015 14:46:37 +0200
Message-Id: <cover.1435927467.git.andreas.ruprecht@fau.de>
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
character), we need to handle the former separately.

Andreas Ruprecht (2):
  kconfig: also warn of unhandled characters in statements
  kconfig: Regenerate shipped zconf.lex.c file

 scripts/kconfig/zconf.l             |  11 +-
 scripts/kconfig/zconf.lex.c_shipped | 453 +++++++++++++++++++++++++-----------
 2 files changed, 322 insertions(+), 142 deletions(-)

-- 
1.9.1

