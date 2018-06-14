Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45304 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755002AbeFNKjd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 06:39:33 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFyHcEojRqf+pvGuZF1nExY_SFWX7QZ7ifBZPtJfB_BWDg@mail.gmail.com>
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
 <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com>
 <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
 <CAK7LNASd7Mc8eU76L24ZC0OFdUf566adNGVvX9Ou987cT3CCWw@mail.gmail.com>
 <CA+55aFz7KGMcvABxJfYs719ySyt2JouDX9t0SAV4Qu9yY9tfPA@mail.gmail.com>
 <CAK7LNAT4m8JgOttC5D16ALKqvMtt-6Vi4nFUdVaTMQSQPwYN-w@mail.gmail.com> <CA+55aFyHcEojRqf+pvGuZF1nExY_SFWX7QZ7ifBZPtJfB_BWDg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Jun 2018 19:38:36 +0900
Message-ID: <CAK7LNAQtVZujrViSRa=8BZHXo184qK7uLhBXxfacwcgXJoZOqQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,


2018-06-14 15:26 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Thu, Jun 14, 2018 at 3:16 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> Could you run sed directly in your tree?
>
> Sure, I did that on the  plane. Now on the ground, pushed out.
> Somebody should double- and triple-check it.
>

I double-checked it.
Yes, renaming is perfect.  Thank you!


However, while I was checking it, I noticed some other issues.

I have sent three patches.
If they look good, could you apply them please?


-- 
Best Regards
Masahiro Yamada
