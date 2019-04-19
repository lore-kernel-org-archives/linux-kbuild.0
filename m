Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:44704 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfDSTVu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Apr 2019 15:21:50 -0400
Subject: Re: [PATCH V1 2/3] kbuild: optimize modules_install target
References: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
 <1554992415-292288-3-git-send-email-steven.sistare@oracle.com>
 <CAK7LNARo=BNXo1JLvrE=z4d=waRTo_RCeF=LE7t5A1csewtm0g@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Message-ID: <7677e9f9-63f1-67f9-3662-4de5d8332c77@oracle.com>
Date: Fri, 19 Apr 2019 15:21:34 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNARo=BNXo1JLvrE=z4d=waRTo_RCeF=LE7t5A1csewtm0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 4/19/2019 12:53 AM, Masahiro Yamada wrote:
> On Thu, Apr 11, 2019 at 11:33 PM Steve Sistare
> <steven.sistare@oracle.com> wrote:
>>
>> Perform module install actions only if the object area module is newer than
>> install area module, and only announce the updated modules.  This saves 10's
>> of seconds for a single CPU make, saves a few seconds for a parallel make,
>> and reduces output clutter for an incremental make.
> 
> This will miss to detect the change of
> CONFIG_MODULE_SIG_ALL, CONFIG_MODULE_COMPRESS.

Thanks, I will fix those (and detect changes of INSTALL_MOD_STRIP).

>> Example:
>>   % touch drivers/virtio/virtio_ring.c
>>   % make modules modules_install
>>   DESCEND  objtool
>>   CALL    scripts/atomic/check-atomics.sh
>>   CALL    scripts/checksyscalls.sh
>>   CC [M]  drivers/virtio/virtio_ring.o
>>   Building modules, stage 2.
>>   MODPOST 2592 modules
>>   LD [M]  drivers/virtio/virtio_ring.ko
>>   INSTALL drivers/virtio/virtio_ring.ko
>>   DEPMOD  5.1.0-rc3
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  Makefile                 |  1 -
>>  scripts/Makefile.modinst | 30 +++++++++++++++++++++++-------
>>  2 files changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 4988dcc..8f58e27 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1286,7 +1286,6 @@ modules_install: _modinst_ _modinst_post
>>
>>  PHONY += _modinst_
>>  _modinst_:
>> -       @rm -rf $(MODLIB)/kernel
>>         @rm -f $(MODLIB)/source
>>         @mkdir -p $(MODLIB)/kernel
>>         @ln -s $(abspath $(srctree)) $(MODLIB)/source
>> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
>> index 0dae402..062fdca6 100644
>> --- a/scripts/Makefile.modinst
>> +++ b/scripts/Makefile.modinst
>> @@ -10,6 +10,12 @@ include scripts/Kbuild.include
>>
>>  #
>>
>> +ifeq ($(quiet),quiet_)
>> +  mod_announce_cmd := echo
>> +else
>> +  mod_announce_cmd := true
>> +endif
> 
> This opts out of the Kbuild policy.

Can you be more specific?  I read the rules under Beautify output and verified
that make -s, make V=0, make V=1 all work with no change in output format.

However, I now see that make V=2 changes a bit.  
For the install_modules targets, the old code produced
  INSTALL drivers/virtio/virtio_ring.ko - due to target is PHONY
but the new code prints only
  INSTALL drivers/virtio/virtio_ring.ko
That does not seem like a big loss of information :)  But I will work on it.

Are you more generally concerned that $(quiet) is used here rather than being
confined to the implementation of $(call cmd ...) ?

- Steve
 
>>  __modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
>>  modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
>>
>> @@ -17,14 +23,24 @@ PHONY += $(modules)
>>  __modinst: $(modules)
>>         @:
>>
>> -# Don't stop modules_install if we can't sign external modules.
>> -quiet_cmd_modules_install = INSTALL $@
>> +# Perform install actions only if the tree module is newer than the installed
>> +# module.  Create the latter with a final move command to avoid a broken
>> +# installed module if one of the intermediate commands fails.  Suppress
>> +# quiet_cmd so that only updated modules are announced.  Don't stop
>> +# modules_install if we can't sign external modules.
>> +
>> +quiet_cmd_modules_install =
>>        cmd_modules_install = \
>> -    mkdir -p $(2) ; \
>> -    cp $@ $(2) ; \
>> -    $(mod_strip_cmd) $(2)/$(notdir $@) ; \
>> -    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
>> -    $(mod_compress_cmd) $(2)/$(notdir $@)
>> +    if [[ $@ -nt $(2)/$(notdir $@) ]]; then \
>> +       $(mod_announce_cmd) '  INSTALL' $@ ; \
>> +       mkdir -p $(2) ; \
>> +       tmpfile=$(2)/.$(notdir $@).tmp ; \
>> +       cp $@ $$tmpfile ; \
>> +       $(mod_strip_cmd) $$tmpfile ; \
>> +       $(mod_sign_cmd) $$tmpfile $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
>> +       $(mod_compress_cmd) $$tmpfile ; \
>> +       mv $$tmpfile $(2)/$(notdir $@) ; \
>> +    fi
>>
>>  # Modules built outside the kernel source tree go into extra by default
>>  INSTALL_MOD_DIR ?= extra
>> --
>> 1.8.3.1
>>
> 
> 
