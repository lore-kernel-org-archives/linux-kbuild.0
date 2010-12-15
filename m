Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:43679 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754768Ab0LOVtV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 16:49:21 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: RFC: multi-sourced file, multiple choice 'instanciations'
Date: Wed, 15 Dec 2010 22:49:18 +0100
References: <201012150034.01356.yann.morin.1998@anciens.enib.fr> <AANLkTinac7i0ZtrpzP3pTj=iFawReoTT0H-1JG=TH7K_@mail.gmail.com>
In-Reply-To: <AANLkTinac7i0ZtrpzP3pTj=iFawReoTT0H-1JG=TH7K_@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-Id: <201012152249.18373.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Arnaud, All,

On Wednesday 15 December 2010 02:46:25 Arnaud Lacombe wrote:
> On Tue, Dec 14, 2010 at 6:34 PM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > But currently, mconf refuses to include the same files more than once:
> >  component-2.in:12: file 'common.in' is already sourced from 'component-1.in'
> >
> > This is trivial to 'fix', when the multi-sourced file does not have choices
> > in it, that is only bools, strings, ints... Just yank the 6-or-so lines that
> > are responsible for the check.
> >
> this open the way to infinite inclusion loop.

Yes, of course. This is indeed not a proper fix, hence the quotes.
If we were to allow multi-sourced files, we'd have to check the inclusion
chain to avoid recursive inclusion.

I can't promise anything, but I will try to look at it tonight (that is,
starting now...).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
