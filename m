Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:34721 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759249Ab3GaOWc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Jul 2013 10:22:32 -0400
Received: by mail-we0-f176.google.com with SMTP id q56so664857wes.35
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Jul 2013 07:22:31 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <gir4eeizm9.fsf@karga.hank.lab>
References: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
	<gir4eeizm9.fsf@karga.hank.lab>
Date: Wed, 31 Jul 2013 16:22:31 +0200
Message-ID: <CA+icZUXL3trj_Zfisxek8dw4HtNbx2fNDq=Gwn5zKjbNh8GDMg@mail.gmail.com>
Subject: Re: kconfig/menu.c: Fixup to "kconfig: fix undesirable side effect of
 adding "visible" menu attribute" ?
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Jan Beulich <JBeulich@novell.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Wed, Jul 31, 2013 at 4:16 PM, Dirk Gouders <dirk@gouders.net> wrote:
> Sedat Dilek <sedat.dilek@gmail.com> writes:
>
>> Hi,
>>
>> The Freetz router project has 370 [1] as a revert-patch of [2] to its
>> kconfig-v3.8.
>>
>> commit 7ad1227818f09242cfe9bf1845fd24211f5f99bd
>> "kconfig: fix undesirable side effect of adding "visible" menu attribute"
>>
>> I am not a kconfig-expert, but [3] looks like a fixup/folowup to it.
>>
>> commit/?id=e983b7b17ad1a978e954e6aaa62cf12bfc747883
>> "kconfig/menu.c: fix multiple references to expressions in menu_add_prop()"
>>
>> I contacted Yann in private, but I think this is worth to ask on the
>> linux-kbuild ML.
>
> Hi Sedat,
>
> you are right, [3] fixes a problem that was introduced by [2].
> (I should have noted that in the commit message -- I'm not sure if we
> can fix that afterwards.)
>

Hi Dirk,

thanks for the clarification and fixing this up.
I told Yann in my private email to always add a reference to the
"culprit" commit (root-cause).
That helps follower - even they (pretend to) have no glue :-)!

Regards,
- Sedat -

> Best regards,
>
> Dirk
>
>> Thanks in advance for your help.
>
>> Regards,
>> - Sedat -
>>
>> [1] http://freetz.org/browser/trunk/tools/make/patches/370-save-hidden-prompts-to-file.kconfig.patch
>> [2] kconfig: fix undesirable side effect of adding "visible" menu attribute
>> [3] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
