Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wildebeest.demon.nl ([212.238.236.112]:40536 "EHLO
        gnu.wildebeest.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751118AbeC3MuE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Mar 2018 08:50:04 -0400
Message-ID: <1522413619.15770.88.camel@fedoraproject.org>
Subject: Re: [RFCv2 PATCH 0/3] Salted build ids via linker sections
From: Mark Wielaard <mjw@fedoraproject.org>
Date: Fri, 30 Mar 2018 14:40:19 +0200
In-Reply-To: <20180329180112.11055-1-labbott@redhat.com>
References: <20180329180112.11055-1-labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

On Thu, 2018-03-29 at 11:01 -0700, Laura Abbott wrote:
> I'm still mostly looking for feedback whether
> this would be acceptable for merging or if we should just persue a
> --build-id-salt in binutils.

Personally I would go with this approach. It seems simple and it might
take years before a new linker option is available everywhere.

To simplify things I think you could just always add the extra vdso
.comment initialized to something like KERNELRELEASE. Which distros
seem to update anyway to include their build number, so they wouldn't
need to do anything special to "update the build salt".

Cheers,

Mark
