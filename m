Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate03.web.de ([217.72.192.234]:38993 "EHLO
	fmmailgate03.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758162AbZDSNlV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Apr 2009 09:41:21 -0400
From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: [PATCH 00/10] kconfig: various fixes and documentation updates
Date: Sun, 19 Apr 2009 15:41:17 +0200
Message-Id: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heidelberg <markus.heidelberg@web.de>

Patches  1-3: documentation updates, typo fixes
Patch      4: .gitignore
Patches  5-8: qconf fixes (compiler warnings/errors)
Patches 9-10: environment variable fixes (KCONFIG_CONFIG + KCONFIG_AUTOCONFIG)

Markus Heidelberg (10):
  kconfig: fix typo "mconfig" to "menuconfig" in a comment
  kconfig: add a note about the deps to the 'silentoldconfig' help
  kconfig: resort the documentation of the environment variables
  gitignore: ignore Kconfig i18n files
  kconfig qconf: fix -Wall compiler warnings
  kconfig qconf: fix namespace for Horizontal and Vertical enum values
  kconfig qconf: add namespace for use of Key_ enum values
  kconfig qconf: fix the type of the desktop widget
  kconfig: do not hardcode ".config" filename
  kconfig: do not hardcode "include/config/auto.conf" filename

 Documentation/kbuild/kconfig.txt |  116 +++++++++++++++++++------------------
 README                           |    1 +
 scripts/kconfig/.gitignore       |    2 +
 scripts/kconfig/Makefile         |    4 +-
 scripts/kconfig/conf.c           |    7 +-
 scripts/kconfig/confdata.c       |   20 ++++---
 scripts/kconfig/lkc.h            |    1 +
 scripts/kconfig/qconf.cc         |   48 +++++++++-------
 scripts/kconfig/util.c           |    6 +-
 9 files changed, 112 insertions(+), 93 deletions(-)

