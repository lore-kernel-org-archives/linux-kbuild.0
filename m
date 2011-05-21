Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:57970 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752Ab1EUIWG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 May 2011 04:22:06 -0400
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/3] fixes, improvements on scripts/export_report.pl
Date: Sat, 21 May 2011 02:21:45 -0600
Message-Id: <1305966108-13399-1-git-send-email-jim.cromie@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

[PATCH 1/3] do collectcfiles work in perl itself, eschew shell pipeline
[PATCH 2/3] sort SECTION 2 output of scripts/export_report.pl
[PATCH 3/3] in scripts/export_report.pl use warn() to issue WARNING, so they go to stderr.

also available at git://github.com/jimc/linux-2.6.git export-report branch
