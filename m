Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-3.rrze.uni-erlangen.de ([131.188.11.22]:48915 "EHLO
	mx-rz-3.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932274AbcFQLI1 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jun 2016 07:08:27 -0400
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: CONFIG_GCC_PLUGIN_SANCOV
From: Andreas Ziegler <andreas.ziegler@fau.de>
In-Reply-To: <5763CFB1.3080107@fau.de>
Date: Fri, 17 Jun 2016 13:08:20 +0200
Content-Transfer-Encoding: 8BIT
Message-Id: <87216487-972A-4E41-B39B-319FFCD8BFEF@fau.de>
References: <5763CFB1.3080107@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

Hi again,

after reading a bit more, it totally makes sense, the plugin obviously needs the
implementation of __sanitizer_cov_trace_pc() coming from CONFIG_KCOV which
selects GCC_PLUGIN_SANCOV in your patch … sorry for the confusion.

Best regards,

Andreas

> On 17 Jun 2016, at 12:23, Andreas Ziegler <andreas.ziegler@fau.de> wrote:
> 
> Hi Emese,
> 
> your patch "Add sancov plugin" (commit 543c37cb1650 in kbuild/for-next) adds the
> GCC_PLUGIN_SANCOV configuration option to arch/Kconfig, but does only declare it
> as 'bool', without a description string.
> 
> This way, it is currently not possible to select the sancov plugin from
> menuconfig, as it does not show up under 'General Setup' -> 'GCC plugins' (the
> cyclomatic complexity one is there, however).
> 
> Is this intended?
> 
> Best regards,
> 
> Andreas

