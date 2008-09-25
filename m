Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.235]:46224 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752912AbYIYKAa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Sep 2008 06:00:30 -0400
Received: by rv-out-0506.google.com with SMTP id k40so374743rvb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Sep 2008 03:00:29 -0700 (PDT)
Message-ID: <8bd0f97a0809250300x634c88cen1c121fbfdf9ca918@mail.gmail.com>
Date: Thu, 25 Sep 2008 06:00:28 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: support for integer comparison in kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

i tried searching but couldnt find anything relevant ... has there
been discussion on the topic of adding integer comparison operators to
the kconfig language ?

for example, in the Blackfin world we control the supported silicon
revision selection (older versions have too many bugs to run Linux
while newer ones arent supported by the toolchain):
config BF_REV_MIN
    int
    default 0 if (BF52x || BF54x)
    default 2 if (BF537 || BF536 || BF534)
config BF_REV_MAX
    int
    default 2 if (BF52x || BF54x)
    default 3 if (BF537 || BF536 || BF534)

we then use these permissible values to build a list of silicon revision flags:
choice
    prompt "Silicon Rev"
config BF_REV_0_0
    bool "0.0"
config BF_REV_0_1
    bool "0.1"
config BF_REV_0_2
    bool "0.2"
config BF_REV_ANY
    bool "any"
config BF_REV_NONE
    bool "none"
endchoice

we'd like to have each numeric config have a depend string like so:
    depends on (BF_REV_MIN <= # && # <= BF_REV_MAX)
unless there is some other kconfig magic i'm not aware of to do this better ?

side note, kconfig will silently transform "<=" into "=" ... boy that
killed some time trying to figure out wtf was going on ;)
-mike
