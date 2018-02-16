Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:61037 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965036AbeBPLxn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 06:53:43 -0500
Subject: Re: [PATCH 15/20] phy: Remove SOC_EXYNOS4212 dep. from
 PHY_EXYNOS4X12_USB
References: <20180205012146.23981-1-ulfalizer@gmail.com>
 <20180205012146.23981-16-ulfalizer@gmail.com>
 <CAJKOXPecaWOgThH6YJ6bNG7u=OZtM+61QyVWD_JyV=8EkHf-gw@mail.gmail.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <5e73b911-b509-cc82-46dc-1dacba732e41@ti.com>
Date: Fri, 16 Feb 2018 17:22:40 +0530
MIME-Version: 1.0
In-Reply-To: <CAJKOXPecaWOgThH6YJ6bNG7u=OZtM+61QyVWD_JyV=8EkHf-gw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, Marek Szyprowski <m.szyprowski@samsung.com>, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, hch@lst.de, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, will.deacon@arm.com, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, Heiko Stuebner <heiko@sntech.de>, Vivek Gautam <vivek.gautam@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>



On Monday 05 February 2018 01:30 PM, Krzysztof Kozlowski wrote:
> On Mon, Feb 5, 2018 at 2:21 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>> Exynos4212 support was removed by commit bca9085e0ae9 ("ARM: dts:
>> exynos: remove Exynos4212 support (dead code)").
>>
>> Remove the SOC_EXYNOS4212 dependency from PHY_EXYNOS4X12_USB.
>>
>> Discovered with the
>> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
>> script.
>>
>> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
>> ---
>>  drivers/phy/samsung/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

merged, thanks!

-Kishon
> 
> Best regards,
> Krzysztof
> 
