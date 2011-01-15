Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:53324 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362Ab1AOVfa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 15 Jan 2011 16:35:30 -0500
Received: by fxm20 with SMTP id 20so4281475fxm.19
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Jan 2011 13:35:28 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 15 Jan 2011 22:35:28 +0100
Message-ID: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com>
Subject: Where is the end of "menuconfig" entry scope?
From: Filip Honckiewicz <f.honckiewicz@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi!
I just want to ask you - Great Developers - where is the end of
"menuconfig" entry scope? I read kconfig-language.txt, but there are
some lacks in documentation, so I don't know which (and why?)
suboption is the last suboption of menuconfig. Is this defined by end
of Kconfig file or what?

Greetings
Filip Honckiewicz
