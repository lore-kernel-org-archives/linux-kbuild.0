Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35512 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756514AbcBHW0J (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 17:26:09 -0500
Received: by mail-oi0-f46.google.com with SMTP id m82so4862476oif.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2016 14:26:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56B8B347.40800@cardoe.com>
References: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
 <20160205031116.GB30154@wfg-t540p.sh.intel.com> <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
 <56B8B347.40800@cardoe.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 8 Feb 2016 14:25:49 -0800
Message-ID: <CALCETrVA2b6_tT6Mb5Dpe8ChkWpLhb1wq=m-UsWSx64+EnJGWA@mail.gmail.com>
Subject: Re: [Xen-devel] Adding Xen to the kbuild bot?
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Ian Campbell <ian.campbell@citrix.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, "Hu, Robert" <robert.hu@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, LKP <lkp@01.org>

On Mon, Feb 8, 2016 at 7:24 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> On 2/5/16 2:10 PM, Andy Lutomirski wrote:
>> On Feb 4, 2016 7:11 PM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
>>>
>>> Hi Andy,
>>>
>>> CC more people on Xen testing -- in case OSStest already (or plans to)
>>> cover such test case.
>>>
>>> On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
>>>> Hi all-
>>>>
>>>> Would it make sense to add some basic Xen PV testing to the kbuild bot?
>>>
>>> Do you mean to run basic Xen testing on the various kernel trees that
>>> 0day robot covers? That is, to catch kernel regressions when running
>>> under Xen.
>>>
>>
>> Yes, exactly.  I've personally broken Linux as a Xen guest at least twice.
>>
>>> If the intention is to catch Xen regressions, the OSStest
>>> infrastructure may be a better option:
>>>
>>>         git://xenbits.xen.org/osstest.git
>>
>> No, I think that 0day should pick one Xen version and stick with it
>> for a while rather than trying to track the latest version.
>>
>>>
>>>> qemu can boot Xen like this:
>>>>
>>>> qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
>>>> kernelarg otherkernelarg=value" -append 'xenarg other_xen_arg'
>>>>
>>>> This should work with any kernel image for x86 or x86_64 with CONFIG_XEN=y.
>>>
>>> Got it. If you have simple working test scripts to illustrate test
>>> details, it'd be a great help for integrating into OSStest or 0day.
>>
>> I have a script that will boot to a command prompt, but I don't know
>> if that's the right way to do it.  I'm not really sure how 0day works
>> under the hood, but treating Xen as a different configuration or arch
>> instead of treating it as a different test case might make more sense.
>>
>> --Andy
>>
>
> Andy,
>
> I'd be curious to see the script you use.

It's virtme with the --xen option.  You can see what it's doing by
adding --show-command --dry-run.

https://git.kernel.org/cgit/utils/kernel/virtme/virtme.git/

For Xen, I find I need to give it a decent amount of ram.  --qemu-opts
-m 1024 at the end seems to work.

This works out to:

/usr/bin/qemu-system-x86_64 -fsdev
local,id=virtfs1,path=/,security_model=none,readonly -device
virtio-9p-pci,fsdev=virtfs1,mount_tag=/dev/root -machine accel=kvm:tcg
-watchdog i6300esb -cpu host -parallel none -net none -echr 1 -serial
none -chardev stdio,id=console,signal=off,mux=on -serial
chardev:console -mon chardev=console -vga none -display none -kernel
xen-4.5.2 -initrd './arch/x86/boot/bzImage
init=/path/to/virtme/virtme/guest/virtme-init
earlyprintk=serial,,ttyS0,,115200 console=ttyS0 psmouse.proto=exps
"virtme_stty_con=rows 35 cols 179 iutf8" TERM=xterm-256color
rootfstype=9p rootflags=version=9p2000.L,,trans=virtio,,access=any
raid=noautodetect ro' -m 1024

I can simplify this a lot to:

/usr/bin/qemu-system-x86_64 -fsdev
local,id=virtfs1,path=/,security_model=none,readonly -device
virtio-9p-pci,fsdev=virtfs1,mount_tag=/dev/root -machine accel=kvm:tcg
-nographic -kernel xen-4.5.2 -initrd './arch/x86/boot/bzImage
earlyprintk=serial,,ttyS0,,115200 console=ttyS0 rootfstype=9p
rootflags=version=9p2000.L,,trans=virtio,,access=any raid=noautodetect
ro init=/bin/bash' -m 1024

Using virtme's init works a lot better, though, if your goal is to get a shell.

--Andy
