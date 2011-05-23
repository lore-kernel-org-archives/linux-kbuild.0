Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:44000 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756404Ab1EWSpL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 14:45:11 -0400
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/3 rev2] fix scripts/export_report.pl
Date: Mon, 23 May 2011 12:44:54 -0600
Message-Id: <1306176297-6964-1-git-send-email-jim.cromie@gmail.com>
In-Reply-To: <1305966108-13399-4-git-send-email-jim.cromie@gmail.com>
References: <1305966108-13399-4-git-send-email-jim.cromie@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rdunlap@xenotime.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

thanks Randy,

rev2 fixes:
NB -> NOTE
cant -> cannot
CONFIG_MODVERSION -> CONFIG_MODVERSIONS (everywhere)

