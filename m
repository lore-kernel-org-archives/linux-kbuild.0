Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from goliath.siemens.de ([192.35.17.28]:56914 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751063AbdK1ImI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Nov 2017 03:42:08 -0500
Date: Tue, 28 Nov 2017 09:41:56 +0100
From: Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH] builddeb: introduce variables for control-file
 customization
Message-ID: <20171128094156.4f2f1cf9@md1em3qc>
In-Reply-To: <CA+r1Zhho-mqtM6Z76pCPFOvxO3n0KR_2Q6fLXJvtBZv5YSU24Q@mail.gmail.com>
References: <20171127161345.17880-1-henning.schild@siemens.com>
        <CA+r1Zhho-mqtM6Z76pCPFOvxO3n0KR_2Q6fLXJvtBZv5YSU24Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, Konrad Schwarz <konrad.schwarz@siemens.com>

Am Mon, 27 Nov 2017 16:57:58 -0700
schrieb Jim Davis <jim.epost@gmail.com>:

> On Mon, Nov 27, 2017 at 9:13 AM, Henning Schild
> <henning.schild@siemens.com> wrote:
> > The debian packages coming out of "make *deb-pkg" lack some critical
> > information in the control-files e.g. the "Depends:" field. If one
> > tries to install a fresh system with such a "linux-image"
> > debootstrap or multistrap might try to install the kernel before
> > its deps and the package hooks will fail.  
> 
> Has that shown up in practice?  The builddeb script goes back some
> years now...

Yes it has, i came across this issue with a multistrap-based installer.
The kernel got picked as one of the first packages. Without explicit
deps i can only assume that deboostrap should be affected as well.
Maybe it processes the package-tree in another order and happens to
work by chance.
My guess is that most people use the builddeb script to install
additional kernels on a running system, so the missing deps never
showed.

That said, the patch would allow for much more customization than just
adding deps. But others might want to customize the other fields as
well.

> > +       eval 'create_package "$kernel_headers_packagename" \
> > +               "$kernel_headers_dir"' "$KDEB_OPTS_IMAGE_HEADERS"  
> 
> eval in a shell script with arbitrary input can lead to shenanigans
> like
> 
> make bindeb-pkg KDEB_OPTS_IMAGE_HEADERS="; echo All your base"
> 
> and other potentially nastier things.  Probably not an issue for a
> typical kernel developer sitting in front of his or her laptop, but if
> I ran a big automated unattended build farm I might prefer a non-eval
> alternative.

True. As you said, that might not be an issue for most people. Let us
discuss the general approach first. If we agree on applying such a
patch and others also raise this issue we might find an implementation
without the eval.
That is a first shot that can handle the kinds of strings one might
want to pass to dpkg-gencontrol. (spaces, pipes and multiple options).

Henning

