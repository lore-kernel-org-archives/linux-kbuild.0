Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34486 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757229AbcG1TIi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 15:08:38 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
References: <20140616132045.GE8170@pd.tnic> <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic> <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic> <20160728082915.GA2349@gmail.com> <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Jul 2016 12:08:37 -0700
Message-ID: <CA+55aFxSTYww0ZJ75q9p4RRwPVSxGji-OJ8vYdjVXuFs-2H3dw@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>

On Thu, Jul 28, 2016 at 12:03 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Once we get to the point that the warning is no longer useful, and is
> more pain than gain, it gets disabled.

Btw, I have a suspicion that you didn't realize that
"-Wmaybe-uninitialized" is separate from "-Wuninitialized" (which is
*not* disabled).

The "maybe-uninitialized" warning is literally gcc saying "I haven't
really followed all the logic, but from my broken understanding it
isn't _obvious_ that it is initialized".

And the problem is that a lot of gcc optimization choices basically
move the pointer of "obvious". So the warning is a bit random to begin
with. And when the gcc people screw thigns up, things go to hell in a
handbasket.

             Linus
