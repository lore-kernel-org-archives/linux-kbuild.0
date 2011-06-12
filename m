Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:39817 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751443Ab1FLSTg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Jun 2011 14:19:36 -0400
MIME-Version: 1.0
In-Reply-To: <4DD0DE2C.4060806@suse.cz>
References: <4DCD8CE4.4090404@suse.cz>
	<b07e7ecdce48bc90a2cf83e8867494dae7cd174f.1305329845.git.mfm@muteddisk.com>
	<20110515154002.GB6274@ghostprotocols.net>
	<4DD0DE2C.4060806@suse.cz>
Date: Sun, 12 Jun 2011 11:19:34 -0700
Message-ID: <BANLkTikvuRwWwb3aux25Ut6ycr0VefrHFQ@mail.gmail.com>
Subject: Re: [PATCH v3] package: Makefile: fix perf target bug
From: matt mooney <mfmooney@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 16, 2011 at 1:19 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 15.5.2011 17:40, Arnaldo Carvalho de Melo wrote:
>>
>> Em Fri, May 13, 2011 at 04:41:12PM -0700, mfmooney@gmail.com escreveu:
>>>
>>> From: matt mooney<mfm@muteddisk.com>
>>>
>>> Specify --git-dir when building perf targets to allow out-of-tree
>>> builds using O=<build-dir>.
>>>
>>> The shell command in `git archive' had to be modified to allow proper
>>> file name expansion of the files listed in MANIFEST.
>>>
>>> Signed-off-by: matt mooney<mfm@muteddisk.com>
>>
>> Michal,
>>
>>        Can I have your Reviewed-by or Acked-by for this one? Assuming
>> all is ok by now :)
>
> Reviewed-by: Michal Marek <mmarek@suse.cz>

I do not believe this patch ever got picked up!

Thanks,
matt

-- 
GPG-Key: 9AFE00EA
