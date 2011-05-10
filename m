Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:21519 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813Ab1EJSUB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2011 14:20:01 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: Choice visibility issue
Date: Tue, 10 May 2011 20:19:58 +0200
References: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
In-Reply-To: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201105102019.58746.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

All,

On Tuesday 10 May 2011 00:53:36 Yann E. MORIN wrote:
> In case a choice appears in two places, and each instance depends on
> different conditions, the visibility of the choice item is not coherent.

Using the previously posted exampl, but with not dependent on ! A
we still have the issue:
   [ ] A
         C (C1)  --->
   [*] B
         C (C1)  --->
==> KO

Now, put the selection of A and B in achoice:

---8<---
  # cat toto-AB.in
  choice AB
      bool "AB"
  config A
      bool "A"
  config B
      bool "B"
  endchoice # AB
  if A
  source toto-C.in
  endif # A
  if B
  source toto-C.in
  endif B

  # cat toto-C.in
  choice C
      bool "C"
  config C1
      bool "C1"
  config C2
      bool "C2"
  endchoice # C
  config D
      bool "D"
---8<---

With this new use case, the choice is always displayed twice, whether A or
B is selected. But the option D is displayed only once.

If A is selected:
      AB (A)  --->
      C (C1)  --->
  [ ] D
      C (C1)  --->

If B is selected (ditto):
      AB (A)  --->
      C (C1)  --->
      C (C1)  --->
  [ ] D

Here is the help entry in case A is selected:
  Symbol: C [=y]
  Type  : boolean
  Prompt: C
    Defined at toto-C.in:1
    Depends on: A [=y]
  Prompt: C
    Defined at toto-C.in:1
    Depends on: B [=n]
    Selected by: A [=y] && m || B [=n] && m

I still have no real clue on where/what to look for... I looked at the
attribute 'visible if', but it applies only to menu blocks.

Arnaud, I just saw your mail while writing this one, I'll look at your
suggestion shortly. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
