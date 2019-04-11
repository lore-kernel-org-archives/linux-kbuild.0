Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50891 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfDKJ0P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 05:26:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id z11so5820416wmi.0
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Apr 2019 02:26:14 -0700 (PDT)
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH linux] objtool: fix pkg-config query in case of
 cross-compilation
References: <20190411083940.3911-1-nicolas.dichtel@6wind.com>
 <4208204.4d101oJ1v5@devpool35>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Message-ID: <cc009072-64d4-4be3-0bb2-20be4d5c357f@6wind.com>
Date: Thu, 11 Apr 2019 11:26:12 +0200
MIME-Version: 1.0
In-Reply-To: <4208204.4d101oJ1v5@devpool35>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rolf Eike Beer <eb@emlix.com>
Cc: tglx@linutronix.de, jpoimboe@redhat.com, yamada.masahiro@socionext.com, peterz@infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Le 11/04/2019 à 10:52, Rolf Eike Beer a écrit :
> Am Donnerstag, 11. April 2019, 10:39:40 CEST schrieb Nicolas Dichtel:
>> In case of cross-compilation, there may be two pkg-config tools, one for
>> the host and one for the target. Enable to override the default name.
>>
>> Fixes: 056d28d135bc ("objtool: Query pkg-config for libelf location")
>> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> 
> If you do that, you have to fix a lot of other places, too. This starts in 
> scripts/kconfig/ and also includes e.g. tools/testing/.
> 
> Usually you have pkg-config for host and ${target_platform}-pkg-config for the 
My use case was for buildroot, which define pkg-config and host-pkgconf. In
fact, I've just seen that a buildroot patch was accepted for this problem:
https://patchwork.ozlabs.org/patch/1081379/


Regards,
Nicolas
