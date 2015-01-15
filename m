Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48340 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751901AbbAOLjK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Jan 2015 06:39:10 -0500
Message-ID: <54B7A6D6.6090006@suse.cz>
Date: Thu, 15 Jan 2015 12:39:02 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v4 20/20] kbuild: add a new kselftest_install make target
 to install selftests
References: <cover.1420571615.git.shuahkh@osg.samsung.com> <2c5a28faaa79d9c2415854a08817ada509fcb943.1420571615.git.shuahkh@osg.samsung.com> <54B69A1B.80006@osg.samsung.com>
In-Reply-To: <54B69A1B.80006@osg.samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, masami.hiramatsu.pt@hitachi.com
Cc: gregkh@linuxfoundation.org, akpm@linux-foundation.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, keescook@chromium.org, tranmanphong@gmail.com, mpe@ellerman.id.au, cov@codeaurora.org, dh.herrmann@gmail.com, hughd@google.com, bobby.prani@gmail.com, serge.hallyn@ubuntu.com, ebiederm@xmission.com, tim.bird@sonymobile.com, josh@joshtriplett.org, koct9i@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, netdev@vger.kernel.org

On 2015-01-14 17:32, Shuah Khan wrote:
> On 01/06/2015 12:43 PM, Shuah Khan wrote:
>> Add a new make target to install to install kernel selftests.
>> This new target will build and install selftests. kselftest
>> target now depends on kselftest_install and runs the generated
>> kselftest script to reduce duplicate work and for common look
>> and feel when running tests.
>>
>> make kselftest_target:
>> -- exports kselftest INSTALL_KSFT_PATH
>>    default $(INSTALL_MOD_PATH)/lib/kselftest/$(KERNELRELEASE)
>> -- exports INSTALL_KSFT_PATH
>> -- runs selftests make install target
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  Makefile | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> Hi Marek,
> 
> Could you please Ack this patch, if this version looks good,
> so I can take this through ksefltest tree.

Sorry, I thought I had acked v3.

Acked-by: Michal Marek <mmarek@suse.cz>

Michal
