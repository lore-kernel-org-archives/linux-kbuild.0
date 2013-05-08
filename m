Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:35678 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753495Ab3EHOPJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 10:15:09 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: RFC: let lxdialog/util.c:print_autowrap() handle newline characters
In-Reply-To: <20130508133522.GD3413@free.fr> (Yann E. MORIN's message of "Wed,
	8 May 2013 15:35:22 +0200")
References: <gisj1xn0un.fsf@karga.hank.lab> <giobclmyw3.fsf@karga.hank.lab>
	<20130508133522.GD3413@free.fr>
Date: Wed, 08 May 2013 16:14:56 +0200
Message-ID: <gifvxxmucf.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On Wed, May 08, 2013 at 02:36:44PM +0200, Dirk Gouders wrote:
>> > Attached is a first version of a patch.  There are other (indirect)
>> > users of print_autowrap() but for now I just modified the text for the
>> > exit dialog.
>> 
>> Sorry for the noise, but I noticed that my patch did not propperly
>> handle cases with short first words of new sentences.  While at it I
>> noticed that strpbrk() makes the code more readable.
>
> Next time you have to send a patch, could you please:
>   - use 'git send-email': that will properly format the patch for
>     sending via email, especially, it does not attach the patch, but
>     in-lines it in the body of the mail, which makes it easier to review
>   - when you send a second (or third...) version of a patch, append a 'v2'
>     (or v3, and so on...) to the subject, like: [PATCH v2] Bla blabla...

Sorry for the inconveniences, I will do my best with the revised version
of the patch.


>>         Do you wish to save your new configuration ? <ESC><ESC>
>>         to continue.
>
> Did you try to replace all the spaces there with newlines, and see what
> happens? Hint: it's ugly, but not because of the newlines: the window is
> not resized accordingly to the new number of lines, so better fix that
> before, too.

Yes, I noticed that when I put just two newlines into that text.  In general
it happens for any text (also without newlines) that does not fit the
window height.

I solved the problem by adjusting the third parameter in the call to
dialog_yesno() and thought that that is the correct way to handle the
window-height-problem if the text does not fit, because print_autowrap()
currently does not care at all if the given text breaks the window.

But I agree, I would be nice if print_autowrap() could handle such cases
and I will see if I find a way to do that.  I am unsure if that should
go into one single patch/commit, though.

>> The author of the dialog text specified a newline and probably
>> expected it to be processed, so let print_autowrap() handle newlines propperly.
>
> Also, please add your SoB (Signed-off-by) line:
>     http://elinux.org/Developer_Certificate_Of_Origin
>
> Otherwise, looks good. I'll do a more thorough review (and testing)
> later (hopefully when you have fixed that window height issue).

Thank you for your first prompt feedback.

Dirk

