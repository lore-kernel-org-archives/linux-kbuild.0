Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35773 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751145AbaHMOzG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Aug 2014 10:55:06 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 64B99AB46
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Aug 2014 14:55:05 +0000 (UTC)
Message-ID: <53EB7C49.6070903@suse.cz>
Date: Wed, 13 Aug 2014 16:55:05 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: firmware: fix build of external firmware
References: <53E34DDC020000780002A045@mail.emea.novell.com> <53E4CEA1.8090207@suse.cz> <53E4ECDE020000780002A9A8@mail.emea.novell.com>
In-Reply-To: <53E4ECDE020000780002A9A8@mail.emea.novell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org

On 2014-08-08 15:29, Jan Beulich wrote:
>>>> On 08.08.14 at 15:20, <mmarek@suse.cz> wrote:
>> On 2014-08-07 09:58, Jan Beulich wrote:
>>> It looks like commit 5180d5f483 ("firmware: Simplify directory
>>> creation") uncovered a latent bug: The cmd_fwbin make macro, which is
>>> being called without any arguments, referenced argument 2, which I
>>> suppose previously just happened to be set to the right value (from an
>>> enclosing macro invocation - some make versions don't always properly
>>> clear unused macro arguments on nested macro invocations). In 3.16 with
>>> such make versions it now points into the source tree instead,
>>> resulting in build failure when building outside the source tree. And
>>> obviously on make versions properly clearing unused arguments it would
>>> have resolved to empty.
>>
>> With which make version are you seeing the error?
> 
> 3.80 and 3.81, albeit with the latter I can't construct a simple
> repro Makefile to demonstrate the problem (hence the mentioning
> of "make versions" _and_ "don't always").

It actually fails for me with the patch and works without:

$ mkdir ~/fw
$ echo 'hello world' >~/fw/test.bin
$ grep FIRMWARE .config
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE="test.bin"
CONFIG_EXTRA_FIRMWARE_DIR="/home/mmarek/fw"
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_GOOGLE_FIRMWARE is not set
$ make
...
  MK_FW   firmware/test.bin.gen.S
  AS      firmware/test.bin.gen.o
firmware/test.bin.gen.S: Assembler messages:
firmware/test.bin.gen.S:5: Error: file not found: firmware/test.bin
make[1]: *** [firmware/test.bin.gen.o] Error 1
make: *** [firmware] Error 2
$ make --version
GNU Make 3.81
...

What are the exact step to reproduce the bug you are seeing?

Thanks,
Michal
