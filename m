Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45914 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751465AbcJAUrH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Oct 2016 16:47:07 -0400
Subject: Re: [PATCH 0/2] Moving runnable code from Documentation (last 2
 patches)
References: <cover.1474912582.git.shuahkh@osg.samsung.com>
 <0f5557aa-23ad-c37c-6d97-13789c0b5726@osg.samsung.com>
 <20161001011044.70aefa33@lwn.net>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57F020B5.4060704@suse.com>
Date: Sat, 1 Oct 2016 22:46:45 +0200
MIME-Version: 1.0
In-Reply-To: <20161001011044.70aefa33@lwn.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuahkh@osg.samsung.com>
Cc: akpm@linux-foundation.org, keescook@chromium.org, dan.j.williams@intel.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com, jpoimboe@redhat.com, tj@kernel.org, aryabinin@virtuozzo.com, nikolay@cumulusnetworks.com, dvyukov@google.com, rostedt@goodmis.org, olof@lixom.net, arnd@arndb.de, hans.verkuil@cisco.com, nab@linux-iscsi.org, mchehab@kernel.org, broonie@kernel.org, tglx@linutronix.de, ecree@solarflare.com, davem@davemloft.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-spi@vger.kernel.org

Dne 1.10.2016 v 09:10 Jonathan Corbet napsal(a):
> On Fri, 30 Sep 2016 07:57:51 -0600
> Shuah Khan <shuahkh@osg.samsung.com> wrote:
> 
>>> This patch series contains the last 2 patches to complete moving runnable
>>> code from Documentation to selftests, samples, and tools.
>>>
>>> The first patch moves blackfin gptimers-example to samples and removes
>>> CONFIG_BUILD_DOCSRC.
>>>
>>> The second one updates 00-INDEX files under Documentation to reflect the
>>> move of runnable code from Documentation.
>>>
>>> Shuah Khan (2):
>>>   samples: move blackfin gptimers-example from Documentation
>>>   Doc: update 00-INDEX files to reflect the runnable code move
>>>   
>>
>> Hi Jon and Michal,
>>
>> Do these patches look good to you? I can get these into 4.9-rc1
>> with your Ack.
> 
> Seems good to me.
> 
> Acked-by: Jonathan Corbet <corbet@lwn.net>

Likewise,

Acked-by: Michal Marek <mmarek@suse.com>

Michal

