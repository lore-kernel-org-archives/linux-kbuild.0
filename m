Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:37902 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756403Ab0HCNmc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Aug 2010 09:42:32 -0400
Message-ID: <4C581CD8.1050606@gmail.com>
Date: Tue, 03 Aug 2010 06:42:48 -0700
From: "Justin P. Mattock" <justinmattock@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH]scripts/kconfig/nconf.gui.c Fix warning: value computed
 is not used
References: <1280790966-417-1-git-send-email-justinmattock@gmail.com> <4C57E88B.8070505@suse.cz>
In-Reply-To: <4C57E88B.8070505@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, zippel@linux-m68k.org, lkml <linux-kernel@vger.kernel.org>, Nir Tzachar <nir.tzachar@gmail.com>

On 08/03/2010 02:59 AM, Michal Marek wrote:
> On 3.8.2010 01:16, Justin P. Mattock wrote:
>> The below patch fixes some warning messages Im getting when doing
>> make nconfig
>>
>>   make nconfig
>>    HOSTCC  scripts/kconfig/nconf.gui.o
>> scripts/kconfig/nconf.gui.c: In function 'print_in_middle':
>> scripts/kconfig/nconf.gui.c:170:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c: In function 'btn_dialog':
>> scripts/kconfig/nconf.gui.c:300:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c:304:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c: In function 'dialog_inputbox':
>> scripts/kconfig/nconf.gui.c:395:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c:397:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c:399:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c:404:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c: In function 'show_scroll_win':
>> scripts/kconfig/nconf.gui.c:534:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c:549:2: warning: value computed is not used
>> scripts/kconfig/nconf.gui.c:551:2: warning: value computed is not used
>>    HOSTLD  scripts/kconfig/nconf
>> scripts/kconfig/nconf arch/x86/Kconfig
>>
>> I looked around for a way to fix these, but am not familiar with ncurses.
>> if there's a better way let me know and/or send a seperate fix.
>>
>> Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>
>> ---
>>   scripts/kconfig/nconf.gui.c |   11 -----------
>>   1 files changed, 0 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
>> index a9d9344..08a5a04 100644
>> --- a/scripts/kconfig/nconf.gui.c
>> +++ b/scripts/kconfig/nconf.gui.c
>> @@ -167,7 +167,6 @@ void print_in_middle(WINDOW *win,
>>   	length = strlen(string);
>>   	temp = (width - length) / 2;
>>   	x = startx + (int)temp;
>> -	wattrset(win, color);
>
> Huh? :) This change makes nconfig look black and white. I'm all for
> eliminating warnings, but please do not eliminate features at the same
> time (or submit a patch with "Subject: make nconfig black and white" and
> do not mask it as warning fixes).
>
> Michal
>

hmm.. make nconfig is black and white even without this patch, is that 
normal?

as for the patch not real sure how to handle these(ncurses), but at 
least you know now.. as for masking this with warning fixes.. ouch!! 
that's a first... these are what gcc 4.6 are giving me not the other way 
around my friend.

I guess I'll put a big fat NAK on there then and throw this in my NAK 
pile etc...

Justin P. Mattock




