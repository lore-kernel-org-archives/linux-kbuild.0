Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.211.176]:56403 "EHLO
	mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097Ab0ADI2F convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2010 03:28:05 -0500
Received: by ywh6 with SMTP id 6so15129902ywh.4
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Jan 2010 00:28:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100103101048.AF4B7E34A26@gemini.denx.de>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-4-git-send-email-ptyser@xes-inc.com> <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
	<1262216393.29396.41.camel@localhost.localdomain> <fa686aa40912301601s6cd0ec4y85b88976159a36af@mail.gmail.com>
	<1262221856.29396.104.camel@localhost.localdomain> <fa686aa41001022108i92596d6qdf2da0e24c34767e@mail.gmail.com>
	<20100103101048.AF4B7E34A26@gemini.denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 4 Jan 2010 01:27:44 -0700
Message-ID: <fa686aa41001040027k76483646p7c59cddc8a364a53@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH v2 3/3] powerpc: Add support for ram filesystems
	in FIT uImages
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfgang Denk <wd@denx.de>
Cc: Peter Tyser <ptyser@xes-inc.com>, u-boot <u-boot@lists.denx.de>, linux-kbuild@vger.kernel.org, linuxppc-dev@ozlabs.org

On Sun, Jan 3, 2010 at 3:10 AM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Grant Likely,
>
> In message <fa686aa41001022108i92596d6qdf2da0e24c34767e@mail.gmail.com> you wrote:
>
> Note that the FIT image can also be made to contain a number of DT
> blobs, and selection of a "board profile" then can be used to boot the
> very sane FIT image file on any of the supported boards - so FIT
> images inherently support multibooting.
>> > I see your point.  The main goal of the patch was to introduce FIT image
>> > support as its the new, more flexible, "better", standard image format
>> > for U-Boot going forward.  Also, lots people aren't aware of FIT images
>> > and the cool stuff they can do with them, so what better way to get the
>> > word out than getting support for FIT images included in the kernel
>> > proper:)
>>
>> Define 'better'.  :-)
>
> FIT images are better than the old uImage format because they:
>
> - allow for strong checksum algorithms like MD5, SHA1, ... (the plain
>  CRC32 method is not good enough if you for example want to run
>  software in a slot machine in Las Vegas).
>
> - can combine multiple kernel images, device tree blobs and root file
>  system images in arbitrary combinations; this allows for example
>  for multibooting the same image on different boards by selecting
>  the right DTB, for software updates with automatic fall-back, etc.
>
> - can be extended to add new features, images types or whatever in a
>  standard way, using a standard technology (device tree support)
>  which is already present anyway, i. e. without additional code
>  overhead.

That's a lot of variability.  More on this at the end of my email...

>> this regard, and I know that multiplatform is a big deal for some of
>> the users.  I'm not interested in encouraging any behaviour that will
>> scuttle deployment of multiplatform kernels.  (That being said, I'm
>
> You misunderstand. FIT images do not scuttle multiplatform kernels.
> Instead they support this much better, as they allow to bundle the
> repsective DTBs into one image file.

I believe I do understand.  The problem with this model is that it
makes the assumption that the kernel image builder has access to ahead
of time the full set of bootable platforms.  That assumption doesn't
hold anymore for a lot of markets where many vendors use the same SoC
in slightly different ways.  I think hardware vendors should be
encouraged to manage dtb blobs separately from the kernel so that we
can get out of the current paradigm of only supporting boards we know
about.

Practical example: Ubuntu on ARM netbooks.  Ubuntu is really not
interested in generating new kernel images every time a vendor
releases a new or modified piece of hardware.

If a vendor still decides that they want a kernel+dtb image then fine;
but I don't think it does the Linux ecosystem any favors to make it
the default choice.

>> not going to actively sabotage people who want to put dtb sections
>> into the kernel images either.  I understand that at times it is
>> necessary, and there are numerous examples of this already in the
>> kernel tree; specifically to support firmware that doesn't implement
>> arch/powerpc's boot interface)
>
> Even if the boot loader supports it, it is usually pretty benefical
> (especially during development) if you can do this.

Nothing prevents using a custom install script to wrap up a custom fit
image when copying it into the tftp directory (or wherever).

>> I'd be okay (perhaps not happy, but okay) with merging fitImage and
>> fitImage.initrd targets (no dtb).  I will resist merging fitImage.%
>> and fitImage.initrd.% targets because I see that very much as a
>> project specific deployment target and I'm not convinced yet that it
>> the pattern is right or that it is even needed in the kernel at all.
>
> Is this just your personal opinion, or do you think that this is
> really what a majority of kernel developers and users are wanting?

I've stated my opinion, my reasons for it, and what I'm willing to
merge.  However, I'm not the only PowerPC maintainer and the others
may disagree.  While I don't particularly like the fit image format,
it won't stop me from merging fitImage and fitImage.initrd patches.

I will not merge fitImage.% and fitImage.initrd.% targets because of
the variability I commented on above.  As you mentioned, there is a
huge amount of flexability in what sections are placed into a fit
image, such as carrying multiple dtb blobs.  However, a fitImage.%
pattern can only express a very specific subset (one kernel image +
one dtb image).  I do not want to codify a particular pattern into the
build system when it seems quite apparent that make targets are
nowhere near expressive enough to do what you're talking about with
fit images.  As is, the targets with embedded .dtbs are already rife
with special cases and other nastiness.

So, I choose to punt it out of the kernel.  If you want to build fit
images beyond just containing an kernel image, then use a custom
install or postprocessing script to assemble the vmlinux, dtb and
initrd building blocks into the image you need.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
