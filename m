Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37444 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754389AbeENRRB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 May 2018 13:17:01 -0400
Subject: Re: [PATCH v3] selftests: add headers_install to lib.mk
References: <20180413090351.25662-1-anders.roxell@linaro.org>
 <20180514115809.9803-1-anders.roxell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3aae54a1-8f94-f9c4-a7e9-5a7b32f18818@redhat.com>
Date: Mon, 14 May 2018 19:16:51 +0200
MIME-Version: 1.0
In-Reply-To: <20180514115809.9803-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, shuah@kernel.org, bamv2005@gmail.com, brgl@bgdev.pl, akpm@linux-foundation.org, rppt@linux.vnet.ibm.com, aarcange@redhat.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org

On 14/05/2018 13:58, Anders Roxell wrote:
> If the kernel headers aren't installed we can't build all the tests.
> Add a new make target rule 'khdr' in the file lib.mk to generate the
> kernel headers and that gets include for every test-dir Makefile that
> includes lib.mk If the testdir in turn have its own sub-dirs the
> top_srcdir needs to be set to the linux-rootdir to be able to generate
> the kernel headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Reviewed-by: Fathi Boudra <fathi.boudra@linaro.org>

Ack for KVM parts.

Paolo
