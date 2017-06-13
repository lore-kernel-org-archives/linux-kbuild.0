Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:27832 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751891AbdFMJuF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 05:50:05 -0400
Subject: Re: [PATCH v2] Kbuild: tiny correction on `make help`
References: <1496740073-3320-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNATSyqcf7X6Cn2GjObBdcW-qBxnS50BhgYAz5wcSKmCEjw@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <593FB5F2.4040206@cn.fujitsu.com>
Date: Tue, 13 Jun 2017 17:52:50 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNATSyqcf7X6Cn2GjObBdcW-qBxnS50BhgYAz5wcSKmCEjw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Yamada-san,

  I have a question on the current top level Makefile. There are
following lines, I have trouble to understand "firstword x$(MAKEFLAGS)"
in 2nd line, why there is a 'x' there?


  ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
  ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
    quiet=silent_
    tools_silent=s
  endif
  else                                    # make-3.8x
  ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
    quiet=silent_
    tools_silent=-s
  endif
  endif

  I already read & understand your patch[*] and know these lines will be
modified, but I have spent quite a few days on understanding it, so I
still want to know the purpose of 'x'.

[*]https://lkml.org/lkml/2017/5/19/371

-- 
Sincerely,
Cao jin

On 06/06/2017 11:01 PM, Masahiro Yamada wrote:
> 2017-06-06 18:07 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> The help info of `make C=1` is little confusing, make it clear.
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> 
> 
> Applied to linux-kbuild/fixes.  Thanks!
> 



