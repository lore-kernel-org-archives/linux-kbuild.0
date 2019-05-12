Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:49744 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfELMYw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 08:24:52 -0400
MIME-Version: 1.0
References: <20190508191341.GA17963@redhat.com>
In-Reply-To: <20190508191341.GA17963@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 12 May 2019 21:23:50 +0900
Message-ID: <CAK7LNASJr8CSWo-yE-YBq085Y=k+x8X-gQopJLRkxTueP4LGmw@mail.gmail.com>
Subject: Re: Build-time tests?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, May 9, 2019 at 4:30 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> Hello kbuild, kselftest,
>
> I've been working on a patchset which adds an additional build script to
> the toolchain when compiling livepatches.  There are a few kernel
> section features in which this script does not yet support, but can
> detect and abort when it encounters.  To test this detection, I've
> written a small set of kernel modules that require such sections.
>
> A few questions:
>
> Is build-testing out of scope for kernel selftests?  For expediency,
> it was really easy to spin out new lib/livepatch kernel modules.
>
> Does kbuild support the notion of expected failure?  In this case, the
> build script returns a non-zero error and the build stops.


If I understood correctly, your are asking about kselftest,
maintained by Shuah Khan.

(Unfortunately), makefiles under tools/ adopted completely
different build system, and it is out of scope of kbuild.


> Am I trying to fit a square peg in a round hole?  I could easily keep
> these build tests in a private branch, but could they exist in a
> different format somewhere else in the tree?
>
> Suggestions welcome,
>
> -- Joe



-- 
Best Regards
Masahiro Yamada
