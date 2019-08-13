Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0107.hostedemail.com ([216.40.44.107]:43637 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726810AbfHMHnS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 03:43:18 -0400
Message-ID: <2a6c7952793a7973c7edc6b2c44ac3c2587562fd.camel@perches.com>
Subject: Re: [PATCH v2] kbuild: Change fallthrough comments to attributes
From: Joe Perches <joe@perches.com>
Date: Tue, 13 Aug 2019 00:43:12 -0700
In-Reply-To: <3078e553a777976655f72718d088791363544caa.camel@perches.com>
References: <20190812214711.83710-1-nhuck@google.com>
         <20190812221416.139678-1-nhuck@google.com>
         <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
         <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
         <20190813063327.GA46858@archlinux-threadripper>
         <3078e553a777976655f72718d088791363544caa.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, clang-built-linux <clang-built-linux@googlegroups.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Tue, 2019-08-13 at 00:04 -0700, Joe Perches wrote:
> On Mon, 2019-08-12 at 23:33 -0700, Nathan Chancellor wrote:
[]
> > a disagreement between GCC and Clang on
> > emitting a warning when falling through to a case statement that is
> > either the last one and empty or simply breaks..
[]
> > I personally think that GCC is right and Clang should adapt but I don't
> > know enough about the Clang codebase to know how feasible this is.
> 
> I think gcc is wrong here and code like
> 
> 	switch (foo) {
> 	case 1:
> 		bar = 1;
> 	default:
> 		break;
> 	}
> 
> should emit a fallthrough warning.

btw: I just filed https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432
