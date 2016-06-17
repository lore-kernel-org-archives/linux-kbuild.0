Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21]:34504 "EHLO
	mx-rz-2.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933693AbcFQKcm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jun 2016 06:32:42 -0400
From: Andreas Ziegler <andreas.ziegler@fau.de>
Subject: CONFIG_GCC_PLUGIN_SANCOV
Message-ID: <5763CFB1.3080107@fau.de>
Date: Fri, 17 Jun 2016 12:23:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

Hi Emese,

your patch "Add sancov plugin" (commit 543c37cb1650 in kbuild/for-next) adds the
GCC_PLUGIN_SANCOV configuration option to arch/Kconfig, but does only declare it
as 'bool', without a description string.

This way, it is currently not possible to select the sancov plugin from
menuconfig, as it does not show up under 'General Setup' -> 'GCC plugins' (the
cyclomatic complexity one is there, however).

Is this intended?

Best regards,

Andreas
