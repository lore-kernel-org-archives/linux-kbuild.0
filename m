Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:33462 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752923Ab1EKCio convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2011 22:38:44 -0400
Received: by iwn34 with SMTP id 34so94685iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 10 May 2011 19:38:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201105102238.47557.yann.morin.1998@anciens.enib.fr>
References: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
	<BANLkTinRk7zbr6odrFhW2YLcHvwnuzEJtg@mail.gmail.com>
	<201105102238.47557.yann.morin.1998@anciens.enib.fr>
Date: Tue, 10 May 2011 22:38:42 -0400
Message-ID: <BANLkTi=_TJTEndK_1gGbZ-ruU6aqCQF_QA@mail.gmail.com>
Subject: Re: Choice visibility issue
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Tue, May 10, 2011 at 4:38 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Arnaud, All,
>
> On Tuesday 10 May 2011 20:12:11 Arnaud Lacombe wrote:
>> On Mon, May 9, 2011 at 6:53 PM, Yann E. MORIN
>> <yann.morin.1998@anciens.enib.fr> wrote:
>> > In case a choice appears in two places, and each instance depends on
>> > different conditions, the visibility of the choice item is not coherent.
> [--SNIP--]
>> > If neither A not B is selected, the choice is not visible (expected):
>> >  [ ] A
>> >  [ ]   B
>> > ==> OK
>> >
>> No, there is a first bug here, B should not appear as a child of A,
>> but it is irrelevant to the other issue. [note for later,
>> menu_finalize() is breaking the tree, damn dependency...]
>
> The first I saw this behavior, I thought as you did: B should not be
> considered a child of A, as it does not depend on A, but on !A.
>
> But then, B is directly dependent on the value of A, so it kind of makes
> sense to treat it as a child of A, and indent it.
>
> Of course, I don't really mind one way or the other. :-)
>
I'd argue this is more a correctness one. A bare config symbol (that
is not a menu or a choice of some sort) cannot do not have children,
whatever the internal representation is. The same apply for choice
_value_.

 - Arnaud
