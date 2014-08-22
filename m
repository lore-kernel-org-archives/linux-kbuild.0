Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:50953 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756316AbaHVOwI convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
	Fri, 22 Aug 2014 10:52:08 -0400
Message-Id: <53F77534020000780002CBFF@mail.emea.novell.com>
Date: Fri, 22 Aug 2014 15:52:04 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: firmware: fix build of external firmware
References: <53E34DDC020000780002A045@mail.emea.novell.com>
 <53E4CEA1.8090207@suse.cz> <53E4ECDE020000780002A9A8@mail.emea.novell.com>
 <53EB7C49.6070903@suse.cz>
In-Reply-To: <53EB7C49.6070903@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

>>> On 13.08.14 at 16:55, <mmarek@suse.cz> wrote:
> On 2014-08-08 15:29, Jan Beulich wrote:
>>>>> On 08.08.14 at 15:20, <mmarek@suse.cz> wrote:
>>> On 2014-08-07 09:58, Jan Beulich wrote:
>>>> It looks like commit 5180d5f483 ("firmware: Simplify directory
>>>> creation") uncovered a latent bug: The cmd_fwbin make macro, which is
>>>> being called without any arguments, referenced argument 2, which I
>>>> suppose previously just happened to be set to the right value (from an
>>>> enclosing macro invocation - some make versions don't always properly
>>>> clear unused macro arguments on nested macro invocations). In 3.16 with
>>>> such make versions it now points into the source tree instead,
>>>> resulting in build failure when building outside the source tree. And
>>>> obviously on make versions properly clearing unused arguments it would
>>>> have resolved to empty.
>>>
>>> With which make version are you seeing the error?
>> 
>> 3.80 and 3.81, albeit with the latter I can't construct a simple
>> repro Makefile to demonstrate the problem (hence the mentioning
>> of "make versions" _and_ "don't always").
> 
> It actually fails for me with the patch and works without:
> 
> $ mkdir ~/fw
> $ echo 'hello world' >~/fw/test.bin
> $ grep FIRMWARE .config
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> CONFIG_FIRMWARE_IN_KERNEL=y
> CONFIG_EXTRA_FIRMWARE="test.bin"
> CONFIG_EXTRA_FIRMWARE_DIR="/home/mmarek/fw"
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FIRMWARE_MEMMAP=y
> # CONFIG_GOOGLE_FIRMWARE is not set
> $ make
> ...
>   MK_FW   firmware/test.bin.gen.S
>   AS      firmware/test.bin.gen.o
> firmware/test.bin.gen.S: Assembler messages:
> firmware/test.bin.gen.S:5: Error: file not found: firmware/test.bin
> make[1]: *** [firmware/test.bin.gen.o] Error 1
> make: *** [firmware] Error 2
> $ make --version
> GNU Make 3.81
> ...
> 
> What are the exact step to reproduce the bug you are seeing?

Okay, I see now where the $(2) comes from and that this is the
correct thing to use. The problem got introduced in a completely
different place: $(objtree) all of the sudden is just . rather than
$(CURDIR) (your commit 7e1c04779e), and I have

# CONFIG_FIRMWARE_IN_KERNEL is not set
CONFIG_EXTRA_FIRMWARE="tigon/tg3_tso.bin"
CONFIG_EXTRA_FIRMWARE_DIR="${objtree}/firmware"

in an attempt to avoid all kinds of other firmware to be put into
the kernel too. The logic at the top of firmware/Makefile now
wrongly tries to locate the file in the source tree rather than the
object one (and note the final conversion being there just to get
rid of the $(objtree) prefix, which seems pretty pointless with
that change of yours).

Jan

