Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:64964 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751992Ab0G2JBp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 05:01:45 -0400
Received: by fxm14 with SMTP id 14so60721fxm.19
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2010 02:01:44 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 29 Jul 2010 11:01:43 +0200
Message-ID: <AANLkTim9b=n7CvnSJhwDrE_HrnJOJ0H=EpOkGBvJt1CC@mail.gmail.com>
Subject: How to access if/endif dependencies programmatically?
From: Vegard Nossum <vegard.nossum@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>

Hi,

Consider the following kconfig fragment:

config A

if A
config B
endif

Here, it would seem that B depends on A. But how can I access this
information programmatically? The struct symbol for B doesn't seem to
contain any properties at all, since it has no prompt or defaults.

If it had any properties, I would get this information from
prop->menu->dep, since prop->menu seems to be the same across all
properties, even if the option doesn't have a prompt. Can we put a
pointer to this menu directly in struct symbol? Or can I add another
property to the symbol containing this information? Any hints for the
best way to do this would be appreciated.

Thanks,


Vegard
