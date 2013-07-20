Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:43555 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754129Ab3GTOoI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Jul 2013 10:44:08 -0400
Received: by mail-wg0-f41.google.com with SMTP id y10so1240417wgg.0
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jul 2013 07:44:07 -0700 (PDT)
Date: Sat, 20 Jul 2013 16:44:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Kconfig test scripts
Message-ID: <20130720144402.GE3507@free.fr>
References: <20130720141905.GA10229@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130720141905.GA10229@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Sam, All,

On 2013-07-20 16:19 +0200, Sam Ravnborg spake thusly:
> Often when I hack on Kconfig I have missed a set of test cases,
> that would allow me to verify that I did not introduce any regressions.
> 
> I have not anything fancy in my mind and I spent
> a little time on the attached today.
> The following is obviously missing a lot a features - but this
> would allow me to get started adding simple test cases.
> 
> The idea is that each test cases consist of a full
> Kconfig file and the resulting output.
> 
> Anyone have something better than this,
> or maybe some brilliant ideas how to do this much better?

How would one express a test for 'choice'? Test randconfig?

I'm all for a test-suite. But we need to be able to test two things:
  - the parser
  - the behaviour

For the first, your static tests are doing (can do) fine.
For the second, we'd need something a bit more sophisticated.

For example, we need a way to tell that one of such or such symbol is
expected, but not both at the same time. Eg, for a choice between A and
B:
    CONFIG_A=y | CONFIG_B=y     (inclusive OR, for tristate choice)
or:
    CONFIG_A=y ^ CONFIG_B=y     (exclusive OR, for boolean choice)

Also, for randconfig, we'd need to be able to repeatedly run a test and
check symbols probability. Eg:
    CONFIG_A=y [25] ^ CONFIG_B=y [75]

Of course, allow for a slight distortion of a few percent to account for
bias in the RNG).

No idea (yet) on how to do that...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
