Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60568 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751090Ab1HSMov (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Aug 2011 08:44:51 -0400
Message-ID: <4E4E5AC1.3040002@suse.cz>
Date: Fri, 19 Aug 2011 14:44:49 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Linux 3.0.1 compile problem on different locales..
References: <CAKxaRTKtCOR7WHcpaTaVj8wqGoLpO04Vt3_aJ-Qfk=4X6CW0NQ@mail.gmail.com> <CACqU3MXNjTTqHs22GNLWS1mrTi5=EQcMYbbStHsuOk9Msd838A@mail.gmail.com> <CAKxaRT+hCXu-921RoNw0aiiffZzNGQNgQX0FGfsfdSOP95DzBQ@mail.gmail.com> <CACqU3MUSji7z507EhpeWgHkqGfJVVXWWbY4Hi15H8LDz3phjZw@mail.gmail.com> <CAKxaRTKutHK+bsgQ6aHhaJ9d3UJ75uDeDNLOtptRgnRKzp968A@mail.gmail.com>
In-Reply-To: <CAKxaRTKutHK+bsgQ6aHhaJ9d3UJ75uDeDNLOtptRgnRKzp968A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-1?Q?Serdar_K=D6YL=DC?= <s.koylux@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 16.8.2011 08:15, Serdar KÖYLÜ wrote:
> Damn gmail ! It's send to your personal mail, not to list :(

Please also do not toppost.


> For my personel know-how, patch kernel Makefile to change build env.
> locale to "C" best solution. This problem can be occurred for other
> langs. in different parts of kernel. Internatinoal linux developers
> cannot be know all trics of other locales, naturally.

People might prefer error messages in their locale. We tried setting
LC_CTYPE=C, which would fix the toupper/tolower problem, but it broke
japanese locales: https://lkml.org/lkml/2009/12/24/58. So I'd rather
handle this in kconfig, either use a pure ascii version of tolower() or
create the files in capitals. BTW, can you paste the whole error message
and a few lines before? It's strange that it failed, because both fixdep
and kconfig use tolower(), so they should agree on the filename.

Michal
