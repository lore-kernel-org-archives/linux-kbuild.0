Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f210.google.com ([209.85.218.210]:33686 "EHLO
	mail-bw0-f210.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757917AbZJLTQT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Oct 2009 15:16:19 -0400
MIME-Version: 1.0
In-Reply-To: <87pr8sfp7k.fsf@basil.nowhere.org>
References: <1255357820-7122-1-git-send-email-nir.tzachar@gmail.com>
	 <87pr8sfp7k.fsf@basil.nowhere.org>
Date: Mon, 12 Oct 2009 21:15:42 +0200
Message-ID: <9b2db90b0910121215s3f875e9ax8342bc35613f7f59@mail.gmail.com>
Subject: Re: [PATCH] nconfig v4
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org, zippel@linux-m68k.org

Hello.

On Mon, Oct 12, 2009 at 8:21 PM, Andi Kleen <andi@firstfloor.org> wrote:
> Nir Tzachar <nir.tzachar@gmail.com> writes:
>
>> Hello.
>>
>> This is a reworked version of nconfig, an ncurses based replacement for
>> menuconfig. The first submission was approximately a year ago. The current patch
>> is applicable to the current git tree.
>
> What are the advantages over the old menuconfig?
>
> That information should be in the patch description.

Sorry. Following is an excerpt from the original patch:

This patch was inspired by the kernel projects page, where an ncurses
replacement for menuconfig was mentioned (by Sam Ravnborg).

Building on menuconfig, this patch implements a more modern look interface using
ncurses and ncurses' satellite libraries (menu, panel, form). The implementation
does not depend on lxdialog, which is currently distributed with the kernel.


> -Andi
>
> --
> ak@linux.intel.com -- Speaking for myself only.
>
