Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56916 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757466Ab1EYMdK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 08:33:10 -0400
Message-ID: <4DDCF705.4030709@suse.cz>
Date: Wed, 25 May 2011 14:33:09 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: kernel build issue whith "make tar-pkg" with INSTALL_FW_PATH
 [patch included]
References: <20110524202935.CF171D602BD@dd12738.kasserver.com> <4DDCF64B.2030802@suse.cz>
In-Reply-To: <4DDCF64B.2030802@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maximilian Pasternak <m.kbuild@bluescreen.de>
Cc: linux-kbuild@vger.kernel.org

On 25.5.2011 14:30, Michal Marek wrote:
> On 24.5.2011 22:29, Maximilian Pasternak wrote:
>> building a kernel package with
>> | make tar-pkg INSTALL_FW_PATH=/somewhere
>>
>>
>> Expected result:
>> ----------------
>> * tar-archive including the firmware in folder /somehere
>
> I don't think that this should be supported, the firmware needs to be
> installed below /lib/firmware, which is where udev expects it.

BTW, you can work around this by:
make INSTALL_FW_PATH=$PWD/tar-install/somewhere

Michal
