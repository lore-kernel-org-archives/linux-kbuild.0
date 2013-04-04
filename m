Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:47386 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1764025Ab3DDH0h (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Apr 2013 03:26:37 -0400
Received: by mail-vc0-f171.google.com with SMTP id ha11so2150559vcb.30
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Apr 2013 00:26:36 -0700 (PDT)
MIME-Version: 1.0
From: Javier Domingo <javierdo1@gmail.com>
Date: Thu, 4 Apr 2013 09:26:16 +0200
Message-ID: <CALZVap=iV=x3b7vug3-mUKrK0ayM5eMGYVQ0xAp83t6AdTd7Kg@mail.gmail.com>
Subject: Adding new tools
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I am part of a research group where we have created a set of modules,
and I have integrated them in our linux repo.

Now, I am trying to do the same with the tools we use to extract
statistics from those modules, configure them, etc. I haven't found
any docs on how to integrate something in the tools dir.

Is there any type of standard I can follow, any rule (like not using
autotools), etc.? I already have those tools configured with
autotools, and I wonder which is the way you recommend to integrate
that.

If you can provide me any clue I would be thankful,

Javier Domingo
